import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/ai/presentation/bloc/ai_chat_bloc.dart';
import '../features/subscription/subscription_screen.dart';
import '../presentation/screens/auth/forgot_password_screen.dart';
import '../presentation/screens/categories/categories_screen.dart';
import '../presentation/screens/transactions/add_transaction_screen.dart';
import '../presentation/screens/transactions/transaction_detail_screen.dart';
import '../service_locator.dart';
import '../widgets/app_shell.dart';
import '../widgets/subscription_gate.dart';
import 'go_router_refresh_stream.dart';
import '../screens/ai_chat_screen.dart';
import '../screens/analytics_screen.dart';
import '../screens/budget_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/settings_screen.dart';

class AppRouter {
  static final authStateNotifier = GoRouterRefreshStream(
    FirebaseAuth.instance.authStateChanges(),
  );

  static Widget _withTitle(String title, Widget child) {
    return Title(
      color: Colors.black,
      title: 'Finance Manager • $title',
      child: child,
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: authStateNotifier,
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final isAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';
      if (!isLoggedIn &&
          !isAuthRoute &&
          state.matchedLocation != '/forgot-password') {
        return '/login';
      }
      if (isLoggedIn && isAuthRoute) return '/dashboard/home';
      if (state.matchedLocation == '/') {
        return isLoggedIn ? '/dashboard' : '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            _withTitle('Home', const SizedBox.shrink()),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => _withTitle('Login', const LoginScreen()),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) =>
            _withTitle('Register', const RegisterScreen()),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) =>
            _withTitle('Forgot Password', const ForgotPasswordScreen()),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            redirect: (context, state) => '/dashboard/home',
          ),
          GoRoute(
            path: '/dashboard/home',
            builder: (context, state) =>
                _withTitle('Dashboard', const HomeScreen()),
          ),
          GoRoute(
            path: '/dashboard/budget',
            builder: (context, state) =>
                _withTitle('Budget', const BudgetScreen()),
          ),
          GoRoute(
            path: '/dashboard/analytics',
            builder: (context, state) => _withTitle(
              'Analytics',
              const SubscriptionGate(
                requiredTier: 'pro',
                reason: 'Upgrade to Pro to unlock analytics and charts.',
                child: AnalyticsScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/dashboard/ai',
            builder: (context, state) => _withTitle(
              'AI Assistant',
              SubscriptionGate(
                requiredTier: 'pro',
                reason: 'Upgrade to Pro to use AI assistant.',
                child: BlocProvider(
                  create: (context) => getIt<AIChatBloc>(),
                  child: const AIChatScreen(),
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/dashboard/settings',
            builder: (context, state) =>
                _withTitle('Settings', const SettingsScreen()),
          ),
        ],
      ),
      GoRoute(
        path: '/subscription',
        builder: (context, state) =>
            _withTitle('Subscription', const SubscriptionScreen()),
      ),
      GoRoute(
        path: '/transaction/add',
        builder: (context, state) =>
            _withTitle('Add Transaction', const AddTransactionScreen()),
      ),
      GoRoute(
        path: '/transaction/:id',
        builder: (context, state) => _withTitle(
          'Transaction Details',
          TransactionDetailScreen(
            transactionId: state.pathParameters['id'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/category/manage',
        builder: (context, state) =>
            _withTitle('Manage Categories', const CategoriesScreen()),
      ),
    ],
  );
}
