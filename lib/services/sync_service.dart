import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/utils/app_logger.dart';
import '../data/repositories/budget_repository.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/income_repository.dart';
import '../data/repositories/recurring_repository.dart';
import '../data/repositories/transaction_repository.dart';
import 'subscription_service.dart';

class SyncService {
  SyncService({
    required TransactionRepository transactionRepository,
    required CategoryRepository categoryRepository,
    required BudgetRepository budgetRepository,
    required RecurringRepository recurringRepository,
    required IncomeRepository incomeRepository,
    required SubscriptionService subscriptionService,
  }) : _transactionRepository = transactionRepository,
       _categoryRepository = categoryRepository,
       _budgetRepository = budgetRepository,
       _recurringRepository = recurringRepository,
       _incomeRepository = incomeRepository,
       _subscriptionService = subscriptionService;

  final TransactionRepository _transactionRepository;
  final CategoryRepository _categoryRepository;
  final BudgetRepository _budgetRepository;
  final RecurringRepository _recurringRepository;
  final IncomeRepository _incomeRepository;
  final SubscriptionService _subscriptionService;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
  _streams = [];

  bool _firestoreConfigured = false;

  Future<void> _configureFirestore() async {
    if (_firestoreConfigured) return;
    _firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    _firestoreConfigured = true;
  }

  Future<void> syncOnLaunch() async {
    if (!_subscriptionService.canUseCloudSync()) {
      AppLogger.info('Sync skipped: free tier (Hive only)');
      return;
    }

    await _configureFirestore();

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await Future.wait([
      _transactionRepository.syncAllTransactions(uid),
      _categoryRepository.syncAllCategories(uid),
      _budgetRepository.syncAllBudgets(uid),
      _recurringRepository.syncAllRecurringTransactions(uid),
      _incomeRepository.syncIncomes(uid),
    ]);

    _attachRealtime(uid);
  }

  void _attachRealtime(String uid) {
    for (final stream in _streams) {
      stream.cancel();
    }
    _streams.clear();

    _streams.add(
      _firestore
          .collection('users')
          .doc(uid)
          .collection('transactions')
          .snapshots()
          .listen((_) async {
            try {
              await _transactionRepository.syncAllTransactions(uid);
              await _incomeRepository.syncIncomes(uid);
            } catch (e) {
              AppLogger.warning('Realtime transaction sync failed: $e');
            }
          }),
    );

    _streams.add(
      _firestore
          .collection('users')
          .doc(uid)
          .collection('categories')
          .snapshots()
          .listen((_) async {
            try {
              await _categoryRepository.syncAllCategories(uid);
            } catch (e) {
              AppLogger.warning('Realtime category sync failed: $e');
            }
          }),
    );

    _streams.add(
      _firestore
          .collection('users')
          .doc(uid)
          .collection('budgets')
          .snapshots()
          .listen((_) async {
            try {
              await _budgetRepository.syncAllBudgets(uid);
            } catch (e) {
              AppLogger.warning('Realtime budget sync failed: $e');
            }
          }),
    );

    _streams.add(
      _firestore
          .collection('users')
          .doc(uid)
          .collection('recurringTransactions')
          .snapshots()
          .listen((_) async {
            try {
              await _recurringRepository.syncAllRecurringTransactions(uid);
            } catch (e) {
              AppLogger.warning('Realtime recurring sync failed: $e');
            }
          }),
    );
  }

  Future<void> queueOfflineSync() async {
    AppLogger.info(
      'Offline mode: Firestore persistence enabled, sync resumes automatically.',
    );
  }

  Future<void> dispose() async {
    for (final stream in _streams) {
      await stream.cancel();
    }
    _streams.clear();
  }
}
