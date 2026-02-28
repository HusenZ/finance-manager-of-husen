import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/validators.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/budget/budget_bloc.dart';
import '../../bloc/budget/budget_event.dart';
import '../../bloc/budget/budget_state.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/loading_widget.dart';

class AddBudgetScreen extends StatefulWidget {
  const AddBudgetScreen({super.key});

  @override
  State<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends State<AddBudgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _limitController = TextEditingController();

  String _selectedCategory = 'Food';
  DateTime _selectedMonth = DateTime.now();

  final List<String> _categories = [
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

  @override
  void dispose() {
    _limitController.dispose();
    super.dispose();
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
    }
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authState = context.read<AuthBloc>().state;
    if (authState is! AuthAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please sign in to create budgets')),
      );
      return;
    }

    final limit = double.parse(_limitController.text);

    context.read<BudgetBloc>().add(
      BudgetEvent.createBudget(
        userId: authState.user.id,
        category: _selectedCategory,
        limit: limit,
        month: _selectedMonth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: const CustomAppBar(title: 'Create Budget'),
      body: BlocConsumer<BudgetBloc, BudgetState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.success,
                ),
              );
              context.pop();
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
          final isLoading = state is BudgetLoading;

          if (isLoading) {
            return const LoadingWidget(message: 'Creating budget...');
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Info Card
                  Card(
                    elevation: 0,
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                            size: 24,
                          ),
                          const SizedBox(width: AppConstants.spacing12),
                          Expanded(
                            child: Text(
                              'Set a spending limit for a category to track your expenses',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),

                  // Budget Details Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Budget Details',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Category Dropdown
                          DropdownButtonFormField<String>(
                            initialValue: _selectedCategory,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              prefixIcon: Icon(
                                _getCategoryIcon(_selectedCategory),
                                color: AppColors.getCategoryColor(
                                  _selectedCategory,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            items: _categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Row(
                                  children: [
                                    Icon(
                                      _getCategoryIcon(category),
                                      size: 20,
                                      color: AppColors.getCategoryColor(
                                        category,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(category),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedCategory = value;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Budget Limit
                          CustomTextField(
                            controller: _limitController,
                            labelText: 'Budget Limit',
                            hintText: '0.00',
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            prefixIcon: const Icon(Icons.currency_rupee),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
                            ],
                            validator: Validators.validateAmount,
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Month Picker
                          InkWell(
                            onTap: () => _selectMonth(context),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Month',
                                prefixIcon: const Icon(Icons.calendar_month),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateFormat(
                                      'MMMM yyyy',
                                    ).format(_selectedMonth),
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing16),

                  // Warning Info Card
                  Card(
                    elevation: 0,
                    color: Colors.orange.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lightbulb_outline,
                                color: Colors.orange.shade700,
                                size: 20,
                              ),
                              const SizedBox(width: AppConstants.spacing8),
                              Text(
                                'Budget Alerts',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade700,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppConstants.spacing8),
                          _buildAlertItem(
                            '80% - Warning',
                            'You\'ll be notified when spending reaches 80%',
                            Colors.orange,
                          ),
                          const SizedBox(height: AppConstants.spacing4),
                          _buildAlertItem(
                            '100% - Exceeded',
                            'Budget limit has been exceeded',
                            AppColors.error,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),

                  // Submit Button
                  CustomButton(
                    text: 'Create Budget',
                    onPressed: _handleSubmit,
                    type: ButtonType.primary,
                    icon: Icons.add,
                  ),
                  const SizedBox(height: AppConstants.spacing8),

                  // Cancel Button
                  CustomButton(
                    text: 'Cancel',
                    onPressed: () => context.pop(),
                    type: ButtonType.outlined,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAlertItem(String title, String subtitle, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: color),
          const SizedBox(width: AppConstants.spacing8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: subtitle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'entertainment':
        return Icons.movie;
      case 'transportation':
        return Icons.directions_car;
      case 'shopping':
        return Icons.shopping_bag;
      case 'utilities':
        return Icons.bolt;
      case 'healthcare':
        return Icons.local_hospital;
      case 'education':
        return Icons.school;
      case 'travel':
        return Icons.flight;
      case 'groceries':
        return Icons.shopping_cart;
      default:
        return Icons.category;
    }
  }
}
