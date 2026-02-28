import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../core/breakpoints.dart';
import '../core/font_size.dart';
import '../core/extensions/num_extensions.dart';
import '../core/spacing.dart';
import '../core/text_styles.dart';
import '../data/models/transaction.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/auth/auth_state.dart';
import '../presentation/bloc/income/income_bloc.dart';
import '../presentation/bloc/income/income_event.dart';
import '../presentation/bloc/income/income_state.dart';
import '../presentation/bloc/transaction/transaction_bloc.dart';
import '../presentation/bloc/transaction/transaction_event.dart';
import '../presentation/bloc/transaction/transaction_state.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthBloc>().state;
    if (auth is AuthAuthenticated) {
      context.read<TransactionBloc>().add(
        TransactionEvent.loadTransactions(userId: auth.user.id),
      );
      context.read<IncomeBloc>().add(
        IncomeEvent.loadIncomes(userId: auth.user.id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    if (auth is! AuthAuthenticated) {
      return const Center(child: Text('Please sign in'));
    }

    final currency = auth.user.currency;
    final desktop = AppBreakpoints.isDesktop(context);
    final tablet = AppBreakpoints.isTablet(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: desktop ? 4.w : 2.w,
        vertical: 2.h,
      ),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, txState) {
          return BlocBuilder<IncomeBloc, IncomeState>(
            builder: (context, inState) {
              if (txState is TransactionLoading || inState is IncomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final tx = txState is TransactionLoaded
                  ? txState.transactions
                  : <Transaction>[];
              final incomes = inState is IncomeLoaded ? inState.incomes : [];

              final totalExpense = tx.fold<double>(
                0.0,
                (sum, e) => sum + e.amount,
              );
              final totalIncome = incomes.fold<double>(
                0.0,
                (sum, e) => sum + (e.amount as double),
              );
              final net = totalIncome - totalExpense;

              if (desktop) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _stat(
                            'Total Income',
                            totalIncome.toCurrency(currency: currency),
                            Icons.trending_up_rounded,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: _stat(
                            'Total Expense',
                            totalExpense.toCurrency(currency: currency),
                            Icons.trending_down_rounded,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: _stat(
                            'Net Balance',
                            net.toCurrency(currency: currency),
                            Icons.account_balance_wallet_rounded,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.md),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 60,
                            child: _chartCard(
                              'Income vs Expense Trend (Line/Bar)',
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            flex: 40,
                            child: _chartCard('Category Split (Pie/Donut)'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSpacing.md),
                    SizedBox(height: 28.h, child: _tableCard(tx, currency)),
                  ],
                );
              }

              return ListView(
                children: [
                  if (tablet)
                    Row(
                      children: [
                        Expanded(
                          child: _stat(
                            'Income',
                            totalIncome.toCurrency(currency: currency),
                            Icons.trending_up_rounded,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: _stat(
                            'Expense',
                            totalExpense.toCurrency(currency: currency),
                            Icons.trending_down_rounded,
                          ),
                        ),
                      ],
                    )
                  else ...[
                    _stat(
                      'Income',
                      totalIncome.toCurrency(currency: currency),
                      Icons.trending_up_rounded,
                    ),
                    SizedBox(height: AppSpacing.md),
                    _stat(
                      'Expense',
                      totalExpense.toCurrency(currency: currency),
                      Icons.trending_down_rounded,
                    ),
                  ],
                  SizedBox(height: AppSpacing.md),
                  _stat(
                    'Net',
                    net.toCurrency(currency: currency),
                    Icons.account_balance_wallet_rounded,
                  ),
                  SizedBox(height: AppSpacing.md),
                  if (tablet)
                    Row(
                      children: [
                        Expanded(child: _chartCard('Trend Chart')),
                        SizedBox(width: 2.w),
                        Expanded(child: _chartCard('Category Pie')),
                      ],
                    )
                  else ...[
                    _chartCard('Trend Chart'),
                    SizedBox(height: AppSpacing.md),
                    _chartCard('Category Pie'),
                  ],
                  SizedBox(height: AppSpacing.md),
                  _tableCard(tx, currency),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _stat(String title, String value, IconData icon) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Row(
            children: [
              Icon(icon, size: 3.h),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.bodySmall),
                    Text(value, style: AppTextStyles.titleLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chartCard(String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.titleMedium),
              SizedBox(height: AppSpacing.sm),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Chart Area',
                      style: TextStyle(fontSize: AppFontSize.of(13)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableCard(List<Transaction> transactions, String currency) {
    final categoryTotals = <String, double>{};
    for (final t in transactions) {
      categoryTotals[t.category] = (categoryTotals[t.category] ?? 0) + t.amount;
    }
    final rows = categoryTotals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category Breakdown', style: AppTextStyles.titleMedium),
            SizedBox(height: AppSpacing.sm),
            Expanded(
              child: ListView.separated(
                itemCount: rows.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final row = rows[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            row.key,
                            style: TextStyle(fontSize: AppFontSize.of(13)),
                          ),
                        ),
                        Text(
                          row.value.toCurrency(currency: currency),
                          style: TextStyle(
                            fontSize: AppFontSize.of(13),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
