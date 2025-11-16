import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/transaction.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/transaction/transaction_bloc.dart';
import '../../bloc/transaction/transaction_event.dart';
import '../../bloc/transaction/transaction_state.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/loading_widget.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/transactions/transaction_list_item.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final _searchController = TextEditingController();
  String? _selectedCategory;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadTransactions() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<TransactionBloc>().add(
            TransactionEvent.loadTransactions(userId: authState.user.id),
          );
    }
  }

  void _searchTransactions(String query) {
    if (query.isEmpty) {
      _loadTransactions();
    } else {
      context.read<TransactionBloc>().add(
            TransactionEvent.searchTransactions(
              query: query,
            ),
          );
    }
  }

  void _filterByCategory(String? category) {
    setState(() {
      _selectedCategory = category;
    });

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      if (category == null) {
        _loadTransactions();
      } else {
        context.read<TransactionBloc>().add(
              TransactionEvent.filterByCategory(
                userId: authState.user.id,
                category: category,
              ),
            );
      }
    }
  }

  void _deleteTransaction(Transaction transaction) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! AuthAuthenticated) return;

    context.read<TransactionBloc>().add(
          TransactionEvent.deleteTransaction(
            userId: authState.user.id,
            transactionId: transaction.id,
          ),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${transaction.description} deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // TODO: Implement undo functionality
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = context.read<AuthBloc>().state;

    if (authState is! AuthAuthenticated) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Transactions'),
        body: Center(
          child: CustomErrorWidget(
            message: 'Please sign in to view transactions',
            onRetry: () => context.go(AppRouter.login),
          ),
        ),
      );
    }

    final currency = authState.user.currency ?? 'INR';

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: _isSearching
          ? _buildSearchAppBar(isDark)
          : _buildNormalAppBar(isDark),
      body: Column(
        children: [
          _buildCategoryFilter(isDark),
          Expanded(
            child: BlocConsumer<TransactionBloc, TransactionState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (message) {
                    _loadTransactions();
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
                return state.when(
                  initial: () => const LoadingWidget(message: 'Loading...'),
                  loading: () =>
                      const LoadingWidget(message: 'Loading transactions...'),
                  loaded: (transactions) {
                    if (transactions.isEmpty) {
                      return EmptyStateWidget(
                        message: 'No transactions yet',
                        subtitle: 'Tap + to add your first transaction',
                        icon: Icons.receipt_long_outlined,
                        onAction: () => context.push(AppRouter.addTransaction),
                        actionText: 'Add Transaction',
                      );
                    }

                    // Sort by date (newest first)
                    final sortedTransactions = List<Transaction>.from(transactions)
                      ..sort((a, b) => b.date.compareTo(a.date));

                    return RefreshIndicator(
                      onRefresh: () async {
                        _loadTransactions();
                      },
                      child: ListView.builder(
                        itemCount: sortedTransactions.length,
                        itemBuilder: (context, index) {
                          final transaction = sortedTransactions[index];
                          return TransactionListItem(
                            transaction: transaction,
                            currency: currency,
                            onTap: () {
                              context.push(
                                '${AppRouter.transactions}/${transaction.id}',
                              );
                            },
                            onDelete: () => _deleteTransaction(transaction),
                          );
                        },
                      ),
                    );
                  },
                  error: (message) => CustomErrorWidget(
                    message: message,
                    onRetry: _loadTransactions,
                  ),
                  success: (_) =>
                      const LoadingWidget(message: 'Updating...'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.addTransaction);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget _buildNormalAppBar(bool isDark) {
    return AppBar(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      title: const Text('Transactions'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            _showFilterOptions();
          },
        ),
      ],
    );
  }

  PreferredSizeWidget _buildSearchAppBar(bool isDark) {
    return AppBar(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          setState(() {
            _isSearching = false;
            _searchController.clear();
          });
          _loadTransactions();
        },
      ),
      title: TextField(
        controller: _searchController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search transactions...',
          border: InputBorder.none,
        ),
        onChanged: _searchTransactions,
      ),
      actions: [
        if (_searchController.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              _loadTransactions();
            },
          ),
      ],
    );
  }

  Widget _buildCategoryFilter(bool isDark) {
    final categories = [
      'All',
      'Food',
      'Entertainment',
      'Transportation',
      'Shopping',
      'Utilities',
      'Healthcare',
      'Education',
      'Travel',
      'Groceries',
      'Other',
    ];

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: AppConstants.spacing8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacing8),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == null
              ? category == 'All'
              : _selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing4,
            ),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                _filterByCategory(category == 'All' ? null : category);
              },
              selectedColor: AppColors.primary.withValues(alpha: 0.2),
              checkmarkColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? AppColors.primary
                    : (isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFilterOptions() {
    // TODO: Implement more advanced filtering options
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Advanced filters coming soon!'),
      ),
    );
  }
}
