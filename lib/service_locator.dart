import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/utils/app_logger.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/budget_repository.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/income_repository.dart';
import 'data/repositories/recurring_repository.dart';
import 'data/repositories/transaction_repository.dart';
import 'data/services/firebase_service.dart';
import 'data/services/hive_service.dart';
import 'features/ai/data/datasources/gemini_datasource.dart';
import 'features/ai/data/repositories/ai_repository_impl.dart';
import 'features/ai/domain/repositories/ai_repository.dart';
import 'features/ai/domain/usecases/get_financial_context.dart';
import 'features/ai/presentation/bloc/ai_chat_bloc.dart';
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/budget/budget_bloc.dart';
import 'presentation/bloc/category/category_bloc.dart';
import 'presentation/bloc/income/income_bloc.dart';
import 'presentation/bloc/recurring/recurring_bloc.dart';
import 'presentation/bloc/transaction/transaction_bloc.dart';
import 'services/auth_service.dart';
import 'services/subscription_service.dart';
import 'services/subscription_sync_service.dart';
import 'services/sync_service.dart';

final getIt = GetIt.instance;
bool _isGoogleSignInInitialized = false;

Future<void> setupServiceLocator() async {
  AppLogger.info('Setting up service locator...');

  final googleSignIn = GoogleSignIn.instance;
  if (!_isGoogleSignInInitialized) {
    try {
      if (kIsWeb) {
        const webClientId = String.fromEnvironment('GOOGLE_WEB_CLIENT_ID');
        if (webClientId.isNotEmpty) {
          await googleSignIn.initialize(clientId: webClientId);
          _isGoogleSignInInitialized = true;
        } else {
          // Avoid hard crash on web when client ID is missing.
          AppLogger.warning(
            'Google Sign-In web client ID is not configured. '
            'Set GOOGLE_WEB_CLIENT_ID via --dart-define or '
            '<meta name="google-signin-client_id" ...> in web/index.html.',
          );
        }
      } else {
        await googleSignIn.initialize();
        _isGoogleSignInInitialized = true;
      }
    } catch (error, stackTrace) {
      AppLogger.warning('Google Sign-In initialization skipped: $error');
      AppLogger.debug(stackTrace.toString());
    }
  }
  getIt.registerLazySingleton<GoogleSignIn>(() => googleSignIn);
  getIt.registerLazySingleton<HiveService>(() => HiveService());
  await getIt<HiveService>().init();

  getIt.registerLazySingleton<AuthService>(
    () => AuthService(googleSignIn: getIt<GoogleSignIn>()),
  );
  getIt.registerLazySingleton<FirebaseService>(() => FirebaseService());
  getIt.registerLazySingleton<SubscriptionService>(() => SubscriptionService());
  getIt.registerLazySingleton<SubscriptionSyncService>(
    () => SubscriptionSyncService(),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      authService: getIt<AuthService>(),
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      subscriptionService: getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      subscriptionService: getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      subscriptionService: getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<BudgetRepository>(
    () => BudgetRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      transactionRepository: getIt<TransactionRepository>(),
      subscriptionService: getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<RecurringRepository>(
    () => RecurringRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      transactionRepository: getIt<TransactionRepository>(),
      subscriptionService: getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<IncomeRepository>(
    () => IncomeRepository(
      getIt<FirebaseService>(),
      getIt<HiveService>(),
      getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<SyncService>(
    () => SyncService(
      transactionRepository: getIt<TransactionRepository>(),
      categoryRepository: getIt<CategoryRepository>(),
      budgetRepository: getIt<BudgetRepository>(),
      recurringRepository: getIt<RecurringRepository>(),
      incomeRepository: getIt<IncomeRepository>(),
      subscriptionService: getIt<SubscriptionService>(),
    ),
  );

  getIt.registerLazySingleton<GeminiDatasource>(() => GeminiDatasource());
  getIt.registerLazySingleton<AIRepository>(
    () => AIRepositoryImpl(getIt<GeminiDatasource>()),
  );
  getIt.registerLazySingleton<GetFinancialContext>(
    () => GetFinancialContext(
      transactionRepository: getIt<TransactionRepository>(),
      incomeRepository: getIt<IncomeRepository>(),
      budgetRepository: getIt<BudgetRepository>(),
    ),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<TransactionBloc>(
    () => TransactionBloc(
      transactionRepository: getIt<TransactionRepository>(),
      categoryRepository: getIt<CategoryRepository>(),
    ),
  );
  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(categoryRepository: getIt<CategoryRepository>()),
  );
  getIt.registerFactory<BudgetBloc>(
    () => BudgetBloc(budgetRepository: getIt<BudgetRepository>()),
  );
  getIt.registerFactory<RecurringBloc>(
    () => RecurringBloc(recurringRepository: getIt<RecurringRepository>()),
  );
  getIt.registerFactory<IncomeBloc>(
    () => IncomeBloc(getIt<IncomeRepository>()),
  );
  getIt.registerFactory<AIChatBloc>(
    () => AIChatBloc(
      geminiDatasource: getIt<GeminiDatasource>(),
      getFinancialContext: getIt<GetFinancialContext>(),
    ),
  );

  AppLogger.info('Service locator setup complete');
}

Future<void> resetServiceLocator() async {
  AppLogger.info('Resetting service locator...');
  await getIt.reset();
  AppLogger.info('Service locator reset complete');
}
