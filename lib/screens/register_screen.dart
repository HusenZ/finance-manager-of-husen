import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../core/breakpoints.dart';
import '../core/font_size.dart';
import '../core/spacing.dart';
import '../core/text_styles.dart';
import '../core/utils/validators.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/auth/auth_event.dart';
import '../presentation/bloc/auth/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) => context.go('/dashboard/home'),
            error: (message) => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message))),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final form = _buildFormCard(context, state is AuthLoading);
          if (isMobile) {
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 92.w),
                  child: form,
                ),
              ),
            );
          }

          return Row(
            children: [
              Expanded(child: _buildBrandPanel(context)),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 3.h,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: form,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBrandPanel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.pie_chart_rounded, color: Colors.white, size: 8.h),
              SizedBox(height: AppSpacing.lg),
              Text(
                'Start Managing Money Better',
                textAlign: TextAlign.center,
                style: AppTextStyles.displayLarge.copyWith(color: Colors.white),
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Create your Finance Manager account',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, bool isLoading) {
    final isDesktop = AppBreakpoints.isDesktop(context);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Create Account', style: AppTextStyles.displayMedium),
              SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) => (value == null || value.trim().length < 2)
                    ? 'Please enter a valid name'
                    : null,
              ),
              SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: Validators.validateEmail,
              ),
              SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                validator: Validators.validatePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                validator: (value) => value == _passwordController.text
                    ? null
                    : 'Passwords do not match',
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    ),
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              SizedBox(
                height: 6.h,
                width: isDesktop ? null : double.infinity,
                child: FilledButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<AuthBloc>().add(
                              AuthEvent.signUpRequested(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                                name: _nameController.text.trim(),
                              ),
                            );
                          }
                        },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'Create Account',
                          style: TextStyle(fontSize: AppFontSize.of(14)),
                        ),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      'OR',
                      style: TextStyle(fontSize: AppFontSize.of(12)),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: AppSpacing.md),
              SizedBox(
                height: 6.h,
                width: isDesktop ? null : double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => context.read<AuthBloc>().add(
                    const AuthEvent.signInWithGoogleRequested(),
                  ),
                  icon: Icon(Icons.g_mobiledata, size: 3.h),
                  label: Text(
                    'Sign up with Google',
                    style: TextStyle(fontSize: AppFontSize.of(14)),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: AppFontSize.of(13)),
                  ),
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: AppFontSize.of(13)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
