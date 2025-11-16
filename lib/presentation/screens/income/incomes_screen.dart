import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/income/income_bloc.dart';
import '../../bloc/income/income_event.dart';
import '../../bloc/income/income_state.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/income/income_card.dart';
import '../../widgets/income/income_summary_card.dart';

class IncomesScreen extends StatefulWidget {
  const IncomesScreen({super.key});

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  DateTime _selectedMonth = DateTime.now();
  String _selectedFilter = 'All';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _filters = [
    'All',
    'Salary',
    'Freelance',
    'Business',
    'Investment',
    'Rental',
    'Bonus',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _loadIncomes();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadIncomes() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<IncomeBloc>().add(
            IncomeEvent.loadIncomesForMonth(
              userId: authState.user.id,
              month: _selectedMonth,
            ),
          );
    }
  }

  void _handleSearch(String query) {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      if (query.isEmpty) {
        _loadIncomes();
      } else {
        context.read<IncomeBloc>().add(
              IncomeEvent.searchIncomes(
                userId: authState.user.id,
                query: query,
              ),
            );
      }
    }
  }

  void _handleFilterChange(String filter) {
    setState(() {
      _selectedFilter = filter;
      _searchController.clear();
    });

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      if (filter == 'All') {
        _loadIncomes();
      } else {
        context.read<IncomeBloc>().add(
              IncomeEvent.filterBySource(
                userId: authState.user.id,
                source: filter,
              ),
            );
      }
    }
  }

  Future<void> _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: 'Select Month',
    );
    if (picked != null && picked != _selectedMonth) {
      setState(() {
        _selectedMonth = DateTime(picked.year, picked.month);
      });
      _loadIncomes();
    }
  }

  void _handleDeleteIncome(String incomeId) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! AuthAuthenticated) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Income'),
        content: const Text('Are you sure you want to delete this income?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<IncomeBloc>().add(
                    IncomeEvent.deleteIncome(
                      userId: authState.user.id,
                      incomeId: incomeId,
                    ),
                  );
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = context.watch<AuthBloc>().state;

    if (authState is! AuthAuthenticated) {
      return Scaffold(
        backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        appBar: const CustomAppBar(title: 'Income'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 80,
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: AppConstants.spacing24),
              Text(
                'Please sign in to view incomes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
    }

    final currencyCode = authState.user.currency ?? 'INR';

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const CustomAppBar(title: 'Income'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRouter.addIncome),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Income',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<IncomeBloc, IncomeState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.error,
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _loadIncomes();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Month selector
                  _buildMonthSelector(context, isDark),

                  // Search bar
                  _buildSearchBar(isDark),

                  // Filter chips
                  _buildFilterChips(isDark),

                  // Content based on state
                  state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: LoadingWidget(message: 'Loading incomes...'),
                    ),
                    loaded: (incomes) {
                      if (incomes.isEmpty) {
                        return _buildEmptyState(context);
                      }

                      return Column(
                        children: [
                          // Summary card
                          IncomeSummaryCard(
                            incomes: incomes,
                            currencyCode: currencyCode,
                            month: _selectedMonth,
                          ),

                          // Income list
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: incomes.length,
                            itemBuilder: (context, index) {
                              final income = incomes[index];
                              return IncomeCard(
                                income: income,
                                currencyCode: currencyCode,
                                onDelete: () => _handleDeleteIncome(income.id),
                                onEdit: () {
                                  // TODO: Navigate to edit screen
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Edit feature coming soon!'),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 80), // FAB padding
                        ],
                      );
                    },
                    totalCalculated: (total) => const SizedBox.shrink(),
                    success: (message) => const SizedBox.shrink(),
                    error: (message) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppConstants.spacing24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: AppColors.error,
                            ),
                            const SizedBox(height: AppConstants.spacing16),
                            Text(
                              'Error',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: AppConstants.spacing8),
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: AppConstants.spacing24),
                            ElevatedButton.icon(
                              onPressed: _loadIncomes,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMonthSelector(BuildContext context, bool isDark) {
    return Container(
      margin: const EdgeInsets.all(AppConstants.spacing16),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing12,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? AppColors.borderDark
              : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _selectedMonth = DateTime(
                  _selectedMonth.year,
                  _selectedMonth.month - 1,
                );
              });
              _loadIncomes();
            },
            icon: const Icon(Icons.chevron_left),
          ),
          Expanded(
            child: InkWell(
              onTap: () => _selectMonth(context),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('MMMM yyyy').format(_selectedMonth),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: AppConstants.spacing8),
                    Icon(
                      Icons.calendar_month,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _selectedMonth = DateTime(
                  _selectedMonth.year,
                  _selectedMonth.month + 1,
                );
              });
              _loadIncomes();
            },
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.spacing16),
      child: TextField(
        controller: _searchController,
        onChanged: _handleSearch,
        decoration: InputDecoration(
          hintText: 'Search incomes...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _handleSearch('');
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: isDark ? AppColors.cardDark : AppColors.cardLight,
        ),
      ),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing16,
      ),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filters.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppConstants.spacing8),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = _selectedFilter == filter;

          return FilterChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (_) => _handleFilterChange(filter),
            backgroundColor: isDark ? AppColors.cardDark : AppColors.cardLight,
            selectedColor: AppColors.primary.withValues(alpha: 0.2),
            checkmarkColor: AppColors.primary,
            labelStyle: TextStyle(
              color: isSelected ? AppColors.primary : null,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 100,
              color: AppColors.primary.withValues(alpha: 0.3),
            ),
            const SizedBox(height: AppConstants.spacing24),
            Text(
              'No Income Yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              _selectedFilter == 'All'
                  ? 'Start tracking your income by adding your first entry'
                  : 'No incomes found for "$_selectedFilter"',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppConstants.spacing32),
            ElevatedButton.icon(
              onPressed: () => context.push(AppRouter.addIncome),
              icon: const Icon(Icons.add),
              label: const Text('Add Income'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing24,
                  vertical: AppConstants.spacing12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
