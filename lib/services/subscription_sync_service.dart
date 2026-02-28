import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/constants/app_constants.dart';
import '../core/secrets.dart';
import '../core/utils/app_logger.dart';
import 'razorpay_api_client.dart';

class SubscriptionSyncService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const _lastSyncKey = 'subscription_last_sync_at';

  Future<void> syncOnLaunch() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final box = await Hive.openBox(AppConstants.settingsBox);
      final last = box.get(_lastSyncKey) as String?;
      final lastSync = last == null ? null : DateTime.tryParse(last);

      if (lastSync != null && DateTime.now().difference(lastSync).inHours < 6) {
        return;
      }

      final docRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('subscription')
          .doc('current');
      final snap = await docRef.get();
      final data = snap.data();
      if (data == null) return;

      final subscriptionId = data['razorpaySubscriptionId'] as String?;
      if (subscriptionId == null || subscriptionId.isEmpty) {
        await box.put(_lastSyncKey, DateTime.now().toIso8601String());
        return;
      }

      final response = await _fetchSubscription(subscriptionId);
      final razorpayStatus = (response['status'] as String? ?? '')
          .toLowerCase();
      final appStatus = _mapStatus(razorpayStatus);
      final currentStatus = (data['status'] as String? ?? '').toLowerCase();

      if (appStatus != currentStatus) {
        await docRef.set({
          'status': appStatus,
          'lastSyncedAt': Timestamp.now(),
        }, SetOptions(merge: true));
      }

      await box.put(_lastSyncKey, DateTime.now().toIso8601String());
    } catch (e, stackTrace) {
      AppLogger.warning('Subscription sync skipped: $e');
      AppLogger.debug(stackTrace.toString());
    }
  }

  String _mapStatus(String status) {
    switch (status) {
      case 'created':
      case 'authenticated':
      case 'active':
        return 'active';
      case 'cancelled':
        return 'cancelled';
      case 'expired':
        return 'expired';
      case 'halted':
        return 'past_due';
      default:
        return 'active';
    }
  }

  Future<Map<String, dynamic>> _fetchSubscription(String subscriptionId) async {
    return razorpayRequest(
      method: 'GET',
      path: '/v1/subscriptions/$subscriptionId',
      keyId: Secrets.razorpayKeyId,
      keySecret: Secrets.razorpayKeySecret,
    );
  }
}
