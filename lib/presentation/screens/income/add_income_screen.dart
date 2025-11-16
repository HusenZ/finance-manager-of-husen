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
import '../../bloc/income/income_bloc.dart';
import '../../bloc/income/income_event.dart';
import '../../bloc/income/income_state.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/loading_widget.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedSource = 'Salary';
  DateTime _selectedDate = DateTime.now();
  bool _isRecurring = false;
  String? _recurrenceFrequency;

  final List<String> _sources = [
    'Salary',
    'Freelance',
    'Business',
    'Investment',
    'Rental',
    'Bonus',
    'Other',
  ];

  final List<String> _frequencies = [
    'Daily',
    'Weekly',
    'Bi-weekly',
    'Monthly',
    'Quarterly',
    'Yearly',
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
      lastDate: DateTime(2030),
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
        const SnackBar(content: Text('Please sign in to add income')),
      );
      return;
    }

    final amount = double.parse(_amountController.text);

    context.read<IncomeBloc>().add(
          IncomeEvent.createIncome(
            userId: authState.user.id,
            amount: amount,
            source: _selectedSource,
            description: _descriptionController.text,
            date: _selectedDate,
            notes: _notesController.text.isNotEmpty ? _notesController.text : null,
            isRecurring: _isRecurring,
            recurrenceFrequency: _isRecurring ? _recurrenceFrequency : null,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: const CustomAppBar(title: 'Add Income'),
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
          final isLoading = state is IncomeLoading;

          if (isLoading) {
            return const LoadingWidget(message: 'Adding income...');
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
                    color: AppColors.success.withValues(alpha: 0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColors.success,
                            size: 24,
                          ),
                          const SizedBox(width: AppConstants.spacing12),
                          Expanded(
                            child: Text(
                              'Track all your income sources to get a complete financial picture',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.success,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),

                  // Income Details Card
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
                            'Income Details',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Amount
                          CustomTextField(
                            controller: _amountController,
                            labelText: 'Amount',
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

                          // Source Dropdown
                          DropdownButtonFormField<String>(
                            value: _selectedSource,
                            decoration: InputDecoration(
                              labelText: 'Income Source',
                              prefixIcon: Icon(
                                _getSourceIcon(_selectedSource),
                                color: _getSourceColor(_selectedSource),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            items: _sources.map((source) {
                              return DropdownMenuItem(
                                value: source,
                                child: Row(
                                  children: [
                                    Icon(
                                      _getSourceIcon(source),
                                      size: 20,
                                      color: _getSourceColor(source),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(source),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedSource = value;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Description
                          CustomTextField(
                            controller: _descriptionController,
                            labelText: 'Description',
                            hintText: 'E.g., Monthly salary, Freelance project',
                            prefixIcon: const Icon(Icons.description_outlined),
                            validator: Validators.validateRequired,
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Date Picker
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Date',
                                prefixIcon: const Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateFormat('MMM dd, yyyy')
                                        .format(_selectedDate),
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: AppConstants.spacing16),

                          // Notes (Optional)
                          CustomTextField(
                            controller: _notesController,
                            labelText: 'Notes (Optional)',
                            hintText: 'Add any additional notes',
                            prefixIcon: const Icon(Icons.note_outlined),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing16),

                  // Recurring Income Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.repeat,
                                color: AppColors.primary,
                                size: 20,
                              ),
                              const SizedBox(width: AppConstants.spacing8),
                              Text(
                                'Recurring Income',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppConstants.spacing8),
                          SwitchListTile(
                            value: _isRecurring,
                            onChanged: (value) {
                              setState(() {
                                _isRecurring = value;
                                if (!value) {
                                  _recurrenceFrequency = null;
                                } else if (_recurrenceFrequency == null) {
                                  _recurrenceFrequency = 'Monthly';
                                }
                              });
                            },
                            title: Text(
                              'This is a recurring income',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            contentPadding: EdgeInsets.zero,
                            activeColor: AppColors.primary,
                          ),
                          if (_isRecurring) ...[
                            const SizedBox(height: AppConstants.spacing8),
                            DropdownButtonFormField<String>(
                              value: _recurrenceFrequency,
                              decoration: InputDecoration(
                                labelText: 'Frequency',
                                prefixIcon: const Icon(Icons.schedule),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              items: _frequencies.map((frequency) {
                                return DropdownMenuItem(
                                  value: frequency,
                                  child: Text(frequency),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _recurrenceFrequency = value;
                                });
                              },
                              validator: (value) {
                                if (_isRecurring && value == null) {
                                  return 'Please select a frequency';
                                }
                                return null;
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),

                  // Submit Button
                  CustomButton(
                    text: 'Add Income',
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

  IconData _getSourceIcon(String source) {
    switch (source.toLowerCase()) {
      case 'salary':
        return Icons.work;
      case 'freelance':
        return Icons.laptop;
      case 'business':
        return Icons.business;
      case 'investment':
        return Icons.trending_up;
      case 'rental':
        return Icons.home;
      case 'bonus':
        return Icons.card_giftcard;
      default:
        return Icons.attach_money;
    }
  }

  Color _getSourceColor(String source) {
    switch (source.toLowerCase()) {
      case 'salary':
        return Colors.blue;
      case 'freelance':
        return Colors.purple;
      case 'business':
        return Colors.green;
      case 'investment':
        return Colors.orange;
      case 'rental':
        return Colors.teal;
      case 'bonus':
        return Colors.pink;
      default:
        return AppColors.success;
    }
  }
}
