import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<TransactionBloc>().add(
        TransactionEvent.loadTransactions(userId: authState.user.id),
      );
      context.read<IncomeBloc>().add(
        IncomeEvent.loadIncomesForMonth(
          userId: authState.user.id,
          month: DateTime.now(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is! AuthAuthenticated) {
      return const Center(child: Text('Please sign in'));
    }

    final currency = authState.user.currency;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppBreakpoints.isDesktop(context) ? 4.w : 2.w,
        vertical: 2.h,
      ),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, txState) {
          return BlocBuilder<IncomeBloc, IncomeState>(
            builder: (context, inState) {
              if (txState is TransactionLoading || inState is IncomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final all = txState is TransactionLoaded
                  ? txState.transactions
                  : <Transaction>[];
              final incomes = inState is IncomeLoaded ? inState.incomes : [];
              final now = DateTime.now();
              final monthTx = all
                  .where(
                    (e) => e.date.year == now.year && e.date.month == now.month,
                  )
                  .toList();
              final query = _searchController.text.trim().toLowerCase();
              final filtered = query.isEmpty
                  ? monthTx
                  : monthTx
                        .where(
                          (e) =>
                              e.description.toLowerCase().contains(query) ||
                              e.category.toLowerCase().contains(query),
                        )
                        .toList();

              final totalIncome = incomes.fold<double>(
                0.0,
                (sum, e) => sum + (e.amount as double),
              );
              final totalExpense = monthTx.fold<double>(
                0.0,
                (sum, e) => sum + e.amount,
              );
              final totalBalance = totalIncome - totalExpense;
              final categories = <String, double>{};
              for (final t in monthTx) {
                categories[t.category] =
                    (categories[t.category] ?? 0) + t.amount;
              }
              final sortedCategories = categories.entries.toList()
                ..sort((a, b) => b.value.compareTo(a.value));

              if (AppBreakpoints.isDesktop(context)) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 65, child: _desktopLeft(filtered, currency)),
                    SizedBox(width: 2.w),
                    Expanded(
                      flex: 35,
                      child: _desktopRight(
                        totalBalance,
                        totalIncome,
                        totalExpense,
                        currency,
                        sortedCategories,
                      ),
                    ),
                  ],
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  final auth = context.read<AuthBloc>().state;
                  if (auth is AuthAuthenticated) {
                    context.read<TransactionBloc>().add(
                      TransactionEvent.loadTransactions(userId: auth.user.id),
                    );
                    context.read<IncomeBloc>().add(
                      IncomeEvent.loadIncomesForMonth(
                        userId: auth.user.id,
                        month: DateTime.now(),
                      ),
                    );
                  }
                },
                child: ListView(
                  children: [
                    _summarySection(
                      context,
                      totalBalance,
                      totalIncome,
                      totalExpense,
                      currency,
                    ),
                    SizedBox(height: AppSpacing.lg),
                    Text('Transactions', style: AppTextStyles.titleLarge),
                    SizedBox(height: AppSpacing.sm),
                    ...filtered.map((tx) => _txTile(tx, currency)),
                    if (filtered.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Center(
                          child: Text(
                            'No transactions for this month',
                            style: AppTextStyles.bodySmall,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _desktopLeft(List<Transaction> transactions, String currency) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search transactions',
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month_rounded, size: 3.h),
                  label: Text(
                    DateFormat('MMMM').format(DateTime.now()),
                    style: TextStyle(fontSize: AppFontSize.of(13)),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),
            Expanded(
              child: transactions.isEmpty
                  ? Center(
                      child: Text(
                        'No transactions for this month',
                        style: AppTextStyles.bodySmall,
                      ),
                    )
                  : ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) =>
                          _txTile(transactions[index], currency),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _desktopRight(
    double balance,
    double income,
    double expense,
    String currency,
    List<MapEntry<String, double>> topCategories,
  ) {
    return ListView(
      shrinkWrap: true,
      children: [
        _statCard(
          'Total Balance',
          balance.toCurrency(currency: currency),
          Icons.account_balance_wallet_rounded,
        ),
        SizedBox(height: AppSpacing.md),
        _statCard(
          'Income',
          income.toCurrency(currency: currency),
          Icons.trending_up_rounded,
        ),
        SizedBox(height: AppSpacing.md),
        _statCard(
          'Expenses',
          expense.toCurrency(currency: currency),
          Icons.trending_down_rounded,
        ),
        SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 6.h,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: FilledButton.icon(
              onPressed: () => context.push('/transaction/add'),
              icon: Icon(Icons.add, size: 3.h),
              label: Text(
                'Quick Add Transaction',
                style: TextStyle(fontSize: AppFontSize.of(14)),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top Categories', style: AppTextStyles.titleMedium),
                SizedBox(height: AppSpacing.sm),
                ...topCategories
                    .take(5)
                    .map(
                      (entry) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.6.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                entry.key,
                                style: TextStyle(fontSize: AppFontSize.of(13)),
                              ),
                            ),
                            Text(
                              entry.value.toCurrency(currency: currency),
                              style: TextStyle(
                                fontSize: AppFontSize.of(13),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _summarySection(
    BuildContext context,
    double balance,
    double income,
    double expense,
    String currency,
  ) {
    final cards = [
      _statCard(
        'Total Balance',
        balance.toCurrency(currency: currency),
        Icons.account_balance_wallet_rounded,
      ),
      _statCard(
        'Income',
        income.toCurrency(currency: currency),
        Icons.trending_up_rounded,
      ),
      _statCard(
        'Expenses',
        expense.toCurrency(currency: currency),
        Icons.trending_down_rounded,
      ),
    ];

    if (AppBreakpoints.isTablet(context)) {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 2.5,
        children: cards,
      );
    }

    return Column(
      children: cards
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: e,
            ),
          )
          .toList(),
    );
  }

  Widget _statCard(String title, String value, IconData icon) {
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

  Widget _txTile(Transaction tx, String currency) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 1.5,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          title: Text(
            tx.description,
            style: TextStyle(fontSize: AppFontSize.of(14)),
          ),
          subtitle: Text(
            '${tx.category} • ${DateFormat('dd MMM').format(tx.date)}',
            style: TextStyle(fontSize: AppFontSize.of(12)),
          ),
          trailing: Text(
            tx.amount.toCurrency(currency: currency),
            style: TextStyle(
              fontSize: AppFontSize.of(13),
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => context.push('/transaction/${tx.id}'),
        ),
      ),
    );
  }
}
