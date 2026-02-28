import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/constants/app_constants.dart';
import '../core/secrets.dart';
import '../core/utils/app_logger.dart';
import 'razorpay_api_client.dart';

class SubscriptionInfo {
  const SubscriptionInfo({
    required this.tier,
    required this.billingCycle,
    required this.razorpaySubscriptionId,
    required this.status,
    required this.currentPeriodEnd,
    required this.aiMessagesUsed,
    required this.aiMessagesResetDate,
    required this.isOwner,
    required this.lastSyncedAt,
  });

  final String tier;
  final String? billingCycle;
  final String? razorpaySubscriptionId;
  final String status;
  final DateTime? currentPeriodEnd;
  final int aiMessagesUsed;
  final DateTime aiMessagesResetDate;
  final bool isOwner;
  final DateTime? lastSyncedAt;

  static SubscriptionInfo freeDefault() => SubscriptionInfo(
    tier: 'free',
    billingCycle: null,
    razorpaySubscriptionId: null,
    status: 'active',
    currentPeriodEnd: null,
    aiMessagesUsed: 0,
    aiMessagesResetDate: DateTime.now(),
    isOwner: false,
    lastSyncedAt: null,
  );

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  factory SubscriptionInfo.fromMap(Map<String, dynamic> data) {
    return SubscriptionInfo(
      tier: (data['tier'] as String? ?? 'free').toLowerCase(),
      billingCycle: data['billingCycle'] as String?,
      razorpaySubscriptionId: data['razorpaySubscriptionId'] as String?,
      status: (data['status'] as String? ?? 'active').toLowerCase(),
      currentPeriodEnd: _parseDate(data['currentPeriodEnd']),
      aiMessagesUsed: (data['aiMessagesUsed'] as num?)?.toInt() ?? 0,
      aiMessagesResetDate:
          _parseDate(data['aiMessagesResetDate']) ?? DateTime.now(),
      isOwner: data['isOwner'] as bool? ?? false,
      lastSyncedAt: _parseDate(data['lastSyncedAt']),
    );
  }

  SubscriptionInfo copyWith({
    String? tier,
    String? billingCycle,
    String? razorpaySubscriptionId,
    String? status,
    DateTime? currentPeriodEnd,
    int? aiMessagesUsed,
    DateTime? aiMessagesResetDate,
    bool? isOwner,
    DateTime? lastSyncedAt,
  }) {
    return SubscriptionInfo(
      tier: tier ?? this.tier,
      billingCycle: billingCycle ?? this.billingCycle,
      razorpaySubscriptionId:
          razorpaySubscriptionId ?? this.razorpaySubscriptionId,
      status: status ?? this.status,
      currentPeriodEnd: currentPeriodEnd ?? this.currentPeriodEnd,
      aiMessagesUsed: aiMessagesUsed ?? this.aiMessagesUsed,
      aiMessagesResetDate: aiMessagesResetDate ?? this.aiMessagesResetDate,
      isOwner: isOwner ?? this.isOwner,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }
}

class SubscriptionService extends ChangeNotifier {
  static const int proAiLimit = 30;

  static const String _cachedTierKey = 'cached_tier';
  static const String _cachedOwnerKey = 'cached_is_owner';
  static const String _cachedAiUsedKey = 'cached_ai_messages_used';
  static const String _cachedAiResetKey = 'cached_ai_reset';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  StreamSubscription<User?>? _authSub;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _subRealtime;

  SubscriptionInfo _current = SubscriptionInfo.freeDefault();

  SubscriptionInfo get current => _current;

  Future<void> initialize() async {
    await _loadCachedState();
    notifyListeners();

    _authSub?.cancel();
    _authSub = _auth.authStateChanges().listen((_) async {
      try {
        await _bindUser();
      } catch (error, stackTrace) {
        AppLogger.warning('Subscription bind failed: $error');
        AppLogger.debug(stackTrace.toString());
        await _fallbackToFreeTier();
      }
    });

    try {
      await _bindUser();
    } catch (error, stackTrace) {
      AppLogger.warning('Subscription initial bind failed: $error');
      AppLogger.debug(stackTrace.toString());
      await _fallbackToFreeTier();
    }
  }

  DocumentReference<Map<String, dynamic>> _doc(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('subscription')
        .doc('current');
  }

  Future<void> _bindUser() async {
    await _subRealtime?.cancel();
    final user = _auth.currentUser;
    if (user == null) {
      _current = SubscriptionInfo.freeDefault();
      notifyListeners();
      return;
    }

    try {
      await initializeUserSubscription(user.uid);
      await evaluateOwnerAccess(user.uid);
      await _resetAiUsageIfNeeded(user.uid);
    } on FirebaseException catch (error, stackTrace) {
      if (_isPermissionDenied(error)) {
        AppLogger.warning(
          'Firestore permission denied while binding subscription; using local free-tier fallback.',
        );
        AppLogger.debug(stackTrace.toString());
        await _fallbackToFreeTier();
        return;
      }
      rethrow;
    }

    _subRealtime = _doc(user.uid).snapshots().listen(
      (snap) async {
        final data = snap.data();
        if (data == null) {
          await initializeUserSubscription(user.uid);
          return;
        }

        _current = SubscriptionInfo.fromMap(data);
        if (isOwner()) {
          _current = _current.copyWith(
            tier: 'premium',
            isOwner: true,
            status: 'active',
          );
        }
        await _cacheState();
        notifyListeners();
      },
      onError: (Object error, StackTrace stackTrace) async {
        AppLogger.warning('Subscription listener failed: $error');
        AppLogger.debug(stackTrace.toString());
        if (_isPermissionDenied(error)) {
          await _fallbackToFreeTier();
        }
      },
    );
  }

  Future<void> initializeUserSubscription(String uid) async {
    try {
      final doc = await _doc(uid).get();
      if (doc.exists) return;

      final owner = uid == Secrets.ownerUid;
      await _doc(uid).set({
        'tier': owner ? 'premium' : 'free',
        'billingCycle': null,
        'razorpaySubscriptionId': null,
        'status': 'active',
        'currentPeriodEnd': null,
        'aiMessagesUsed': 0,
        'aiMessagesResetDate': Timestamp.now(),
        'isOwner': owner,
        'lastSyncedAt': null,
      });
    } on FirebaseException catch (error, stackTrace) {
      if (_isPermissionDenied(error)) {
        AppLogger.warning(
          'Firestore permission denied while creating subscription doc.',
        );
        AppLogger.debug(stackTrace.toString());
        return;
      }
      rethrow;
    }
  }

  Future<void> evaluateOwnerAccess(String uid) async {
    if (uid != Secrets.ownerUid) return;

    try {
      await _doc(uid).set({
        'tier': 'premium',
        'status': 'active',
        'isOwner': true,
      }, SetOptions(merge: true));
    } on FirebaseException catch (error, stackTrace) {
      if (_isPermissionDenied(error)) {
        AppLogger.warning(
          'Firestore permission denied while updating owner access; applying local owner state.',
        );
        AppLogger.debug(stackTrace.toString());
      } else {
        rethrow;
      }
    }

    _current = _current.copyWith(
      tier: 'premium',
      isOwner: true,
      status: 'active',
    );
    await _cacheState();
    notifyListeners();
  }

  Future<void> refresh() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    try {
      final doc = await _doc(uid).get();
      final data = doc.data();
      if (data == null) return;

      _current = SubscriptionInfo.fromMap(data);
      await _cacheState();
      notifyListeners();
    } on FirebaseException catch (error, stackTrace) {
      if (_isPermissionDenied(error)) {
        AppLogger.warning('Subscription refresh denied by Firestore rules.');
        AppLogger.debug(stackTrace.toString());
        await _fallbackToFreeTier();
        return;
      }
      rethrow;
    }
  }

  Future<void> _resetAiUsageIfNeeded(String uid) async {
    try {
      final doc = await _doc(uid).get();
      final data = doc.data();
      if (data == null) return;

      final resetAt =
          SubscriptionInfo._parseDate(data['aiMessagesResetDate']) ??
          DateTime.now();
      final now = DateTime.now();
      if (_isDifferentMonth(now, resetAt)) {
        await _doc(uid).set({
          'aiMessagesUsed': 0,
          'aiMessagesResetDate': Timestamp.now(),
        }, SetOptions(merge: true));
      }
    } on FirebaseException catch (error, stackTrace) {
      if (_isPermissionDenied(error)) {
        AppLogger.warning(
          'AI usage reset skipped due to Firestore permission denial.',
        );
        AppLogger.debug(stackTrace.toString());
        return;
      }
      rethrow;
    }
  }

  bool canUseCloudSync() =>
      isOwner() || _current.tier == 'pro' || _current.tier == 'premium';
  bool canUseAnalytics() =>
      isOwner() || _current.tier == 'pro' || _current.tier == 'premium';
  bool canUseAI() =>
      isOwner() || _current.tier == 'pro' || _current.tier == 'premium';
  bool hasUnlimitedAI() => isOwner() || _current.tier == 'premium';

  bool canAddCategory(int currentCount) {
    if (isOwner()) return true;
    if (_current.tier == 'free') return currentCount < 3;
    return true;
  }

  bool canViewHistory(int monthsBack) {
    if (isOwner()) return true;
    if (_current.tier == 'free') return monthsBack <= 2;
    return true;
  }

  int aiMessagesRemaining() {
    if (!canUseAI()) return 0;
    if (hasUnlimitedAI()) return 1 << 30;
    final remaining = proAiLimit - _current.aiMessagesUsed;
    return remaining < 0 ? 0 : remaining;
  }

  bool isOwner() =>
      _auth.currentUser?.uid == Secrets.ownerUid || _current.isOwner;

  bool hasTier(String requiredTier) {
    if (isOwner()) return true;
    const order = {'free': 0, 'pro': 1, 'premium': 2};
    return (order[_current.tier] ?? 0) >= (order[requiredTier] ?? 0);
  }

  Future<void> incrementAiUsage() async {
    if (isOwner() || hasUnlimitedAI() || !canUseAI()) return;
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _resetAiUsageIfNeeded(uid);
    final next = _current.aiMessagesUsed + 1;
    _current = _current.copyWith(aiMessagesUsed: next);
    notifyListeners();

    try {
      await _doc(uid).set({'aiMessagesUsed': next}, SetOptions(merge: true));
      await _cacheState();
    } on FirebaseException catch (error, stackTrace) {
      if (_isPermissionDenied(error)) {
        AppLogger.warning(
          'AI usage write denied by Firestore rules; cached state only.',
        );
        AppLogger.debug(stackTrace.toString());
        await _cacheState();
        return;
      }
      rethrow;
    }
  }

  static const Map<String, String> _planIds = {
    'pro_monthly': Secrets.razorpayPlanIdProMonthly,
    'pro_annual': Secrets.razorpayPlanIdProAnnual,
    'premium_monthly': Secrets.razorpayPlanIdPremiumMonthly,
    'premium_annual': Secrets.razorpayPlanIdPremiumAnnual,
  };

  String _planKey(String tier, String billingCycle) => '${tier}_$billingCycle';

  Future<Map<String, dynamic>> createRazorpaySubscription({
    required String tier,
    required String billingCycle,
  }) async {
    if (Secrets.razorpayKeyId == 'rzp_live_or_test_xxx' ||
        Secrets.razorpayKeySecret == 'your_secret_here') {
      throw Exception(
        'Please configure Razorpay key id/secret in lib/core/secrets.dart',
      );
    }

    final key = _planKey(tier, billingCycle);
    final planId = _planIds[key];
    final isPlaceholder =
        planId == null ||
        planId.isEmpty ||
        planId == 'plan_PRO_MONTHLY' ||
        planId == 'plan_PRO_ANNUAL' ||
        planId == 'plan_PREMIUM_MONTHLY' ||
        planId == 'plan_PREMIUM_ANNUAL';
    if (isPlaceholder) {
      throw Exception(
        'Please configure Razorpay plan id for $key in lib/core/secrets.dart',
      );
    }

    final payload = jsonEncode({
      'plan_id': planId,
      'total_count': billingCycle == 'annual' ? 1 : 120,
      'customer_notify': 1,
    });

    final response = await _razorpayRequest(
      method: 'POST',
      path: '/v1/subscriptions',
      body: payload,
    );

    final id = response['id'] as String?;
    if (id == null || id.isEmpty) {
      throw Exception('Unable to create Razorpay subscription');
    }

    return {'subscription_id': id, 'tier': tier, 'billing_cycle': billingCycle};
  }

  bool verifyRazorpayPayment({
    required String razorpayPaymentId,
    required String razorpaySubscriptionId,
    required String razorpaySignature,
  }) {
    final key = utf8.encode(Secrets.razorpayKeySecret);
    final message = utf8.encode('$razorpaySubscriptionId|$razorpayPaymentId');
    final hmac = Hmac(sha256, key);
    final expectedSignature = hmac.convert(message).toString();
    return expectedSignature == razorpaySignature;
  }

  Future<void> confirmRazorpayPayment({
    required String tier,
    required String billingCycle,
    required String razorpayPaymentId,
    required String razorpaySubscriptionId,
    required String razorpaySignature,
  }) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('User not signed in');

    final valid = verifyRazorpayPayment(
      razorpayPaymentId: razorpayPaymentId,
      razorpaySubscriptionId: razorpaySubscriptionId,
      razorpaySignature: razorpaySignature,
    );

    if (!valid) {
      throw Exception('Payment signature verification failed');
    }

    await _doc(uid).set({
      'tier': tier,
      'billingCycle': billingCycle,
      'razorpaySubscriptionId': razorpaySubscriptionId,
      'status': 'active',
      'lastSyncedAt': Timestamp.now(),
    }, SetOptions(merge: true));

    await refresh();
  }

  Future<void> cancelSubscription(String subscriptionId) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw Exception('User not signed in');

    await _razorpayRequest(
      method: 'POST',
      path: '/v1/subscriptions/$subscriptionId/cancel',
      body: jsonEncode({'cancel_at_cycle_end': 1}),
    );

    await _doc(uid).set({
      'status': 'cancelled',
      'lastSyncedAt': Timestamp.now(),
    }, SetOptions(merge: true));

    await refresh();
  }

  Future<bool> waitForActiveStatus({
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await refresh();
      if (_current.status == 'active') return true;
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    return false;
  }

  Future<Map<String, dynamic>> _razorpayRequest({
    required String method,
    required String path,
    String? body,
  }) async {
    return razorpayRequest(
      method: method,
      path: path,
      keyId: Secrets.razorpayKeyId,
      keySecret: Secrets.razorpayKeySecret,
      body: body,
    );
  }

  Future<void> _loadCachedState() async {
    final box = await Hive.openBox(AppConstants.settingsBox);
    final cachedTier = box.get(_cachedTierKey) as String?;
    final cachedOwner = box.get(_cachedOwnerKey) as bool?;
    final cachedAiUsed = box.get(_cachedAiUsedKey) as int?;
    final cachedAiReset = box.get(_cachedAiResetKey) as String?;

    if (cachedTier != null) {
      _current = _current.copyWith(
        tier: cachedTier,
        isOwner: cachedOwner ?? false,
        aiMessagesUsed: cachedAiUsed ?? 0,
        aiMessagesResetDate: cachedAiReset != null
            ? DateTime.tryParse(cachedAiReset) ?? DateTime.now()
            : DateTime.now(),
      );
    }
  }

  Future<void> _cacheState() async {
    final box = await Hive.openBox(AppConstants.settingsBox);
    await box.put(_cachedTierKey, _current.tier);
    await box.put(_cachedOwnerKey, _current.isOwner);
    await box.put(_cachedAiUsedKey, _current.aiMessagesUsed);
    await box.put(
      _cachedAiResetKey,
      _current.aiMessagesResetDate.toIso8601String(),
    );
  }

  bool _isPermissionDenied(Object error) {
    return error is FirebaseException && error.code == 'permission-denied';
  }

  Future<void> _fallbackToFreeTier() async {
    _current = SubscriptionInfo.freeDefault();
    await _cacheState();
    notifyListeners();
  }

  bool _isDifferentMonth(DateTime a, DateTime b) =>
      a.year != b.year || a.month != b.month;

  @override
  void dispose() {
    _authSub?.cancel();
    _subRealtime?.cancel();
    super.dispose();
  }
}
