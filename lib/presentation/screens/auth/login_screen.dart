import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/validators.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/loading_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.signInRequested(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _handleGoogleSignIn() {
    context.read<AuthBloc>().add(const AuthEvent.signInWithGoogleRequested());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (user) {
              context.go(AppRouter.dashboard);
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingWidget(message: 'Signing in...'),
            orElse: () => SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppConstants.spacing24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          size: 80,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: AppConstants.spacing16),
                        Text(
                          'Finance Manager',
                          textAlign: TextAlign.center,
                          style: isDark
                              ? AppTextStyles.heading1Dark
                              : AppTextStyles.heading1Light,
                        ),
                        const SizedBox(height: AppConstants.spacing8),
                        Text(
                          'Sign in to your account',
                          textAlign: TextAlign.center,
                          style: isDark
                              ? AppTextStyles.bodyMediumDark
                              : AppTextStyles.bodyMediumLight,
                        ),
                        const SizedBox(height: AppConstants.spacing48),
                        CustomTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: Validators.validateEmail,
                          textCapitalization: TextCapitalization.none,
                        ),
                        const SizedBox(height: AppConstants.spacing16),
                        CustomTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          obscureText: _obscurePassword,
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: Validators.validatePassword,
                        ),
                        const SizedBox(height: AppConstants.spacing8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context.push(AppRouter.forgotPassword);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: isDark
                                  ? AppTextStyles.labelMediumDark.copyWith(
                                      color: AppColors.primary,
                                    )
                                  : AppTextStyles.labelMediumLight.copyWith(
                                      color: AppColors.primary,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppConstants.spacing24),
                        CustomButton(
                          text: 'Sign In',
                          onPressed: _handleLogin,
                          type: ButtonType.primary,
                        ),
                        const SizedBox(height: AppConstants.spacing16),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: isDark
                                    ? AppColors.borderDark
                                    : AppColors.borderLight,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.spacing16,
                              ),
                              child: Text(
                                'OR',
                                style: isDark
                                    ? AppTextStyles.bodySmallDark
                                    : AppTextStyles.bodySmallLight,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: isDark
                                    ? AppColors.borderDark
                                    : AppColors.borderLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppConstants.spacing16),
                        CustomButton(
                          text: 'Sign in with Google',
                          onPressed: _handleGoogleSignIn,
                          type: ButtonType.outlined,
                          icon: Icons.g_mobiledata,
                        ),
                        const SizedBox(height: AppConstants.spacing24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: isDark
                                  ? AppTextStyles.bodyMediumDark
                                  : AppTextStyles.bodyMediumLight,
                            ),
                            TextButton(
                              onPressed: () {
                                context.push(AppRouter.signup);
                              },
                              child: Text(
                                'Sign Up',
                                style: isDark
                                    ? AppTextStyles.labelMediumDark.copyWith(
                                        color: AppColors.primary,
                                      )
                                    : AppTextStyles.labelMediumLight.copyWith(
                                        color: AppColors.primary,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
