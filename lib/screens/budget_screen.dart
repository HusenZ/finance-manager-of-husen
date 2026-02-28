import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../core/breakpoints.dart';
import '../core/font_size.dart';
import '../core/extensions/num_extensions.dart';
import '../core/spacing.dart';
import '../core/text_styles.dart';
import '../data/models/budget.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/auth/auth_state.dart';
import '../presentation/bloc/budget/budget_bloc.dart';
import '../presentation/bloc/budget/budget_event.dart';
import '../presentation/bloc/budget/budget_state.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<BudgetBloc>().add(
        BudgetEvent.loadBudgetsForMonth(
          userId: authState.user.id,
          month: DateTime.now(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! AuthAuthenticated) {
      return const Center(child: Text('Please sign in'));
    }

    final currency = authState.user.currency;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = AppBreakpoints.isDesktop(context);
    final crossAxisCount = isDesktop
        ? 3
        : (AppBreakpoints.isTablet(context) ? 2 : 1);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 4.w : 2.w,
        vertical: 2.h,
      ),
      child: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          final budgets = state.maybeWhen(
            loaded: (items) => items,
            orElse: () => <Budget>[],
          );

          if (state is BudgetLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (budgets.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_balance_wallet_outlined, size: 6.h),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'No budgets found for this month',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: AppSpacing.md),
                  SizedBox(
                    height: 6.h,
                    child: FilledButton(
                      onPressed: () => context.push('/dashboard/settings'),
                      child: Text(
                        'Manage Settings',
                        style: TextStyle(fontSize: AppFontSize.of(14)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 6.h,
                  child: FilledButton.icon(
                    onPressed: () => context.push('/transaction/add'),
                    icon: Icon(Icons.add, size: 3.h),
                    label: Text(
                      'Add Expense',
                      style: TextStyle(fontSize: AppFontSize.of(14)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: width < 700 ? 1.45 : 1.25,
                  ),
                  itemCount: budgets.length,
                  itemBuilder: (context, index) =>
                      _budgetCard(budgets[index], currency),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _budgetCard(Budget budget, String currency) {
    final progress = budget.percentage.clamp(0.0, 1.0);
    final warning = budget.isExceeded
        ? ('Exceeded by ${(-budget.remaining).toCurrency(currency: currency)}')
        : budget.isWarning
        ? 'Near budget limit'
        : 'On track';

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      budget.category,
                      style: AppTextStyles.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.w,
                      vertical: 0.4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: budget.isExceeded
                          ? Colors.red.withValues(alpha: 0.15)
                          : budget.isWarning
                          ? Colors.orange.withValues(alpha: 0.15)
                          : Colors.green.withValues(alpha: 0.15),
                    ),
                    child: Text(
                      warning,
                      style: TextStyle(fontSize: AppFontSize.of(11)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                '${budget.spent.toCurrency(currency: currency)} / ${budget.limit.toCurrency(currency: currency)}',
                style: TextStyle(
                  fontSize: AppFontSize.of(13),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 1.h,
                  color: budget.isExceeded
                      ? Colors.red
                      : budget.isWarning
                      ? Colors.orange
                      : Colors.green,
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Remaining: ${budget.remaining.toCurrency(currency: currency)}',
                style: TextStyle(fontSize: AppFontSize.of(12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
