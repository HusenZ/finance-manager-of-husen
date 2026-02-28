import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../core/breakpoints.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/font_size.dart';
import '../../../core/spacing.dart';
import '../../../core/utils/validators.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/transaction/transaction_bloc.dart';
import '../../bloc/transaction/transaction_event.dart';
import '../../bloc/transaction/transaction_state.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/loading_widget.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedCategory = 'Food';
  String _selectedPaymentMethod = 'Cash';
  DateTime _selectedDate = DateTime.now();

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

  final List<String> _paymentMethods = [
    'Cash',
    'Credit Card',
    'Debit Card',
    'UPI',
    'Net Banking',
  ];

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
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
        const SnackBar(content: Text('Please sign in to add transactions')),
      );
      return;
    }

    final amount = double.parse(_amountController.text);
    final description = _descriptionController.text.trim();
    final notes = _notesController.text.trim();

    context.read<TransactionBloc>().add(
      TransactionEvent.createTransaction(
        userId: authState.user.id,
        amount: amount,
        category: _selectedCategory,
        description: description,
        date: _selectedDate,
        paymentMethod: _selectedPaymentMethod,
        notes: notes.isEmpty ? null : notes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = AppBreakpoints.isDesktop(context);
    final isTablet = AppBreakpoints.isTablet(context);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: const CustomAppBar(title: 'Add Transaction'),
      body: BlocConsumer<TransactionBloc, TransactionState>(
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
          if (state is TransactionLoading) {
            return const LoadingWidget(message: 'Adding transaction...');
          }

          return SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isDesktop
                      ? 1200
                      : (isTablet ? 900 : double.infinity),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 4.w : 3.w,
                    vertical: 2.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: _buildFormColumn(context),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                flex: 3,
                                child: _buildRightPanel(context),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _buildFormColumn(context),
                              SizedBox(height: AppSpacing.md),
                              _buildActions(context, isDesktop: false),
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

  Widget _buildFormColumn(BuildContext context) {
    final isDesktop = AppBreakpoints.isDesktop(context);

    return Column(
      children: [
        _sectionCard(
          title: 'Amount',
          child: TextFormField(
            controller: _amountController,
            onChanged: (_) => setState(() {}),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            validator: Validators.validateAmount,
            style: TextStyle(fontSize: AppFontSize.of(14)),
            decoration: InputDecoration(
              labelText: 'Enter amount',
              hintText: '0.00',
              prefixIcon: Icon(Icons.currency_rupee, size: 3.h),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.md),
        _sectionCard(
          title: 'Transaction Details',
          child: Column(
            children: [
              TextFormField(
                controller: _descriptionController,
                onChanged: (_) => setState(() {}),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                style: TextStyle(fontSize: AppFontSize.of(14)),
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'What did you spend on?',
                  prefixIcon: Icon(Icons.description_outlined, size: 3.h),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Category',
                  prefixIcon: Icon(
                    _getCategoryIcon(_selectedCategory),
                    size: 3.h,
                  ),
                ),
                items: _categories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: [
                            Icon(_getCategoryIcon(category), size: 2.5.h),
                            SizedBox(width: 1.w),
                            Expanded(
                              child: Text(
                                category,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: AppFontSize.of(13)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
                },
              ),
              SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _selectedPaymentMethod,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Payment Method',
                  prefixIcon: Icon(
                    _getPaymentMethodIcon(_selectedPaymentMethod),
                    size: 3.h,
                  ),
                ),
                items: _paymentMethods
                    .map(
                      (method) => DropdownMenuItem(
                        value: method,
                        child: Row(
                          children: [
                            Icon(_getPaymentMethodIcon(method), size: 2.5.h),
                            SizedBox(width: 1.w),
                            Expanded(
                              child: Text(
                                method,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: AppFontSize.of(13)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  }
                },
              ),
              SizedBox(height: AppSpacing.md),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      prefixIcon: Icon(Icons.calendar_today_rounded, size: 3.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMM dd, yyyy').format(_selectedDate),
                          style: TextStyle(fontSize: AppFontSize.of(14)),
                        ),
                        Icon(Icons.arrow_drop_down_rounded, size: 3.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                style: TextStyle(fontSize: AppFontSize.of(14)),
                decoration: InputDecoration(
                  labelText: 'Notes (Optional)',
                  hintText: 'Add any additional notes',
                  prefixIcon: Icon(Icons.note_outlined, size: 3.h),
                ),
              ),
            ],
          ),
        ),
        if (isDesktop) ...[
          SizedBox(height: AppSpacing.md),
          _buildActions(context, isDesktop: true),
        ],
      ],
    );
  }

  Widget _buildRightPanel(BuildContext context) {
    return Column(
      children: [
        _sectionCard(
          title: 'Live Preview',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _previewRow(
                'Amount',
                _amountController.text.isEmpty
                    ? '0.00'
                    : _amountController.text,
              ),
              SizedBox(height: AppSpacing.sm),
              _previewRow('Category', _selectedCategory),
              SizedBox(height: AppSpacing.sm),
              _previewRow('Payment', _selectedPaymentMethod),
              SizedBox(height: AppSpacing.sm),
              _previewRow(
                'Date',
                DateFormat('MMM dd, yyyy').format(_selectedDate),
              ),
              SizedBox(height: AppSpacing.sm),
              _previewRow(
                'Description',
                _descriptionController.text.isEmpty
                    ? '-'
                    : _descriptionController.text,
              ),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),
        _sectionCard(
          title: 'Tips',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• Keep descriptions short and specific',
                style: TextStyle(fontSize: AppFontSize.of(12)),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                '• Choose the exact payment method',
                style: TextStyle(fontSize: AppFontSize.of(12)),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                '• Add notes only when needed',
                style: TextStyle(fontSize: AppFontSize.of(12)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context, {required bool isDesktop}) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 6.h,
            child: ElevatedButton.icon(
              onPressed: _handleSubmit,
              icon: Icon(Icons.add_rounded, size: 3.h),
              label: Text(
                'Add Transaction',
                style: TextStyle(fontSize: AppFontSize.of(14)),
              ),
            ),
          ),
        ),
        SizedBox(width: isDesktop ? 1.w : 2.w),
        Expanded(
          child: SizedBox(
            height: 6.h,
            child: OutlinedButton(
              onPressed: () => context.pop(),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: AppFontSize.of(14)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: AppFontSize.of(15),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _previewRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 8.w,
          child: Text(
            label,
            style: TextStyle(fontSize: AppFontSize.of(12), color: Colors.grey),
          ),
        ),
        SizedBox(width: 1.w),
        Expanded(
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: AppFontSize.of(13),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
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

  IconData _getPaymentMethodIcon(String method) {
    switch (method.toLowerCase()) {
      case 'cash':
        return Icons.money;
      case 'credit card':
        return Icons.credit_card;
      case 'debit card':
        return Icons.payment;
      case 'upi':
        return Icons.qr_code_scanner;
      case 'net banking':
        return Icons.account_balance;
      default:
        return Icons.payment;
    }
  }
}
