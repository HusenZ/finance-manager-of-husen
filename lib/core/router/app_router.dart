import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/auth/auth_state.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/signup_screen.dart';
import '../../presentation/screens/auth/forgot_password_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/home/dashboard_screen.dart';
import '../../presentation/screens/transactions/transactions_screen.dart';
import '../../presentation/screens/transactions/add_transaction_screen.dart';
import '../../presentation/screens/transactions/transaction_detail_screen.dart';
import '../../presentation/screens/budget/budgets_screen.dart';
import '../../presentation/screens/budget/add_budget_screen.dart';
import '../../presentation/screens/analytics/analytics_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/categories/categories_screen.dart';
import '../../presentation/screens/recurring/recurring_screen.dart';
import '../../presentation/screens/income/incomes_screen.dart';
import '../../presentation/screens/income/add_income_screen.dart';
import '../../features/ai/presentation/screens/ai_chat_screen.dart';
import '../../features/ai/presentation/bloc/ai_chat_bloc.dart';
import '../../features/subscription/subscription_screen.dart';
import '../../widgets/subscription_gate.dart';
import '../../service_locator.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String transactions = '/transactions';
  static const String addTransaction = '/transactions/add';
  static const String transactionDetail = '/transactions/:id';
  static const String budgets = '/budgets';
  static const String addBudget = '/budgets/add';
  static const String analytics = '/analytics';
  static const String settings = '/settings';
  static const String categories = '/categories';
  static const String recurring = '/recurring';
  static const String incomes = '/incomes';
  static const String addIncome = '/incomes/add';
  static const String aiChat = '/ai-chat';
  static const String subscription = '/subscription';

  static GoRouter router(BuildContext context) {
    return GoRouter(
      initialLocation: splash,
      redirect: (BuildContext context, GoRouterState state) {
        final authState = context.read<AuthBloc>().state;
        final isAuthenticated = authState is AuthAuthenticated;
        final isGoingToAuth =
            state.matchedLocation == login ||
            state.matchedLocation == signup ||
            state.matchedLocation == forgotPassword;
        final isOnSplash = state.matchedLocation == splash;

        // If not authenticated and not going to auth screens, redirect to login
        if (!isAuthenticated && !isGoingToAuth && !isOnSplash) {
          return login;
        }

        // If authenticated and going to auth screens, redirect to dashboard
        if (isAuthenticated && isGoingToAuth) {
          return dashboard;
        }

        return null;
      },
      routes: [
        GoRoute(
          path: splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(path: login, builder: (context, state) => const LoginScreen()),
        GoRoute(
          path: signup,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: forgotPassword,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: transactions,
          builder: (context, state) => const TransactionsScreen(),
        ),
        GoRoute(
          path: addTransaction,
          builder: (context, state) => const AddTransactionScreen(),
        ),
        GoRoute(
          path: transactionDetail,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return TransactionDetailScreen(transactionId: id);
          },
        ),
        GoRoute(
          path: budgets,
          builder: (context, state) => const BudgetsScreen(),
        ),
        GoRoute(
          path: addBudget,
          builder: (context, state) => const AddBudgetScreen(),
        ),
        GoRoute(
          path: analytics,
          builder: (context, state) => const SubscriptionGate(
            requiredTier: 'pro',
            reason: 'Upgrade to Pro to unlock analytics and charts.',
            child: AnalyticsScreen(),
          ),
        ),
        GoRoute(
          path: settings,
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: categories,
          builder: (context, state) => const CategoriesScreen(),
        ),
        GoRoute(
          path: recurring,
          builder: (context, state) => const SubscriptionGate(
            requiredTier: 'premium',
            reason: 'Recurring automation is available on Premium.',
            child: RecurringScreen(),
          ),
        ),
        GoRoute(
          path: incomes,
          builder: (context, state) => const IncomesScreen(),
        ),
        GoRoute(
          path: addIncome,
          builder: (context, state) => const AddIncomeScreen(),
        ),
        GoRoute(
          path: aiChat,
          builder: (context, state) => SubscriptionGate(
            requiredTier: 'pro',
            reason: 'Upgrade to Pro to use the AI financial assistant.',
            child: BlocProvider(
              create: (context) => getIt<AIChatBloc>(),
              child: const AIChatScreen(),
            ),
          ),
        ),
        GoRoute(
          path: subscription,
          builder: (context, state) => const SubscriptionScreen(),
        ),
      ],
    );
  }
}
