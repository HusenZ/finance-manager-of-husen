import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Services
import 'data/services/auth_service.dart';
import 'data/services/firebase_service.dart';
import 'data/services/hive_service.dart';

// Repositories
import 'data/repositories/auth_repository.dart';
import 'data/repositories/transaction_repository.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/budget_repository.dart';
import 'data/repositories/recurring_repository.dart';
import 'data/repositories/income_repository.dart';

// BLoCs
import 'presentation/bloc/auth/auth_bloc.dart';
import 'presentation/bloc/transaction/transaction_bloc.dart';
import 'presentation/bloc/category/category_bloc.dart';
import 'presentation/bloc/budget/budget_bloc.dart';
import 'presentation/bloc/recurring/recurring_bloc.dart';
import 'presentation/bloc/income/income_bloc.dart';

import 'core/utils/app_logger.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  AppLogger.info('Setting up service locator...');

  // Register Firebase instances
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // Register Services
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  getIt.registerLazySingleton<AuthService>(
    () => AuthService(
      firebaseAuth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
    ),
  );

  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseService(
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  // Initialize Hive
  await getIt<HiveService>().init();

  // Register Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      authService: getIt<AuthService>(),
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
    ),
  );

  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
    ),
  );

  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
    ),
  );

  getIt.registerLazySingleton<BudgetRepository>(
    () => BudgetRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      transactionRepository: getIt<TransactionRepository>(),
    ),
  );

  getIt.registerLazySingleton<RecurringRepository>(
    () => RecurringRepository(
      firebaseService: getIt<FirebaseService>(),
      hiveService: getIt<HiveService>(),
      transactionRepository: getIt<TransactionRepository>(),
    ),
  );

  getIt.registerLazySingleton<IncomeRepository>(
    () => IncomeRepository(
      getIt<FirebaseService>(),
      getIt<HiveService>(),
    ),
  );

  // Register BLoCs as factories (new instance each time)
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<TransactionBloc>(
    () => TransactionBloc(
      transactionRepository: getIt<TransactionRepository>(),
      categoryRepository: getIt<CategoryRepository>(),
    ),
  );

  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(
      categoryRepository: getIt<CategoryRepository>(),
    ),
  );

  getIt.registerFactory<BudgetBloc>(
    () => BudgetBloc(
      budgetRepository: getIt<BudgetRepository>(),
    ),
  );

  getIt.registerFactory<RecurringBloc>(
    () => RecurringBloc(
      recurringRepository: getIt<RecurringRepository>(),
    ),
  );

  getIt.registerFactory<IncomeBloc>(
    () => IncomeBloc(
      getIt<IncomeRepository>(),
    ),
  );

  AppLogger.info('Service locator setup complete');
}

Future<void> resetServiceLocator() async {
  AppLogger.info('Resetting service locator...');
  await getIt.reset();
  AppLogger.info('Service locator reset complete');
}
