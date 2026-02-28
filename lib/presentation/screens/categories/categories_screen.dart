import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../presentation/bloc/auth/auth_bloc.dart';
import '../../../presentation/bloc/auth/auth_state.dart';
import '../../../presentation/bloc/category/category_bloc.dart';
import '../../../presentation/bloc/category/category_event.dart';
import '../../../presentation/bloc/category/category_state.dart';
import '../../../service_locator.dart';
import '../../../services/subscription_service.dart';
import '../../../widgets/paywall_bottom_sheet.dart';
import '../../widgets/common/custom_app_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final SubscriptionService _subscriptionService = getIt<SubscriptionService>();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      context.read<CategoryBloc>().add(
        CategoryEvent.loadCategories(userId: authState.user.id),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Categories'),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            success: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            success: (_) => const SizedBox.shrink(),
            loaded: (categories) {
              final customCount = categories.where((c) => c.isCustom).length;
              final canAdd = _subscriptionService.canAddCategory(customCount);

              return Column(
                children: [
                  if (!_subscriptionService.isOwner() && !canAdd)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      color: AppColors.primary.withValues(alpha: 0.08),
                      child: const Text(
                        'Free tier limit reached (3 custom categories). Upgrade for unlimited categories.',
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return ListTile(
                          leading: const Icon(Icons.category_outlined),
                          title: Text(category.name),
                          subtitle: Text(
                            category.isCustom ? 'Custom' : 'Default',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onAddCategoryPressed,
        icon: const Icon(Icons.add),
        label: const Text('Add Category'),
      ),
    );
  }

  Future<void> _onAddCategoryPressed() async {
    final authState = context.read<AuthBloc>().state;
    if (authState is! AuthAuthenticated) return;

    final state = context.read<CategoryBloc>().state;
    final categories = state.maybeWhen(
      loaded: (categories) => categories,
      orElse: () => const [],
    );

    final customCount = categories.where((c) => c.isCustom).length;
    if (!_subscriptionService.canAddCategory(customCount)) {
      if (!mounted) return;
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (_) => const PaywallBottomSheet(
          reason: 'Upgrade to add unlimited categories.',
        ),
      );
      return;
    }

    final nameController = TextEditingController();
    final created =
        await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Create Category'),
            content: TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Category name'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Create'),
              ),
            ],
          ),
        ) ??
        false;

    if (!created) return;

    final name = nameController.text.trim();
    if (name.isEmpty) return;

    context.read<CategoryBloc>().add(
      CategoryEvent.createCategory(
        userId: authState.user.id,
        name: name,
        icon: '📦',
        color: 'FF607D8B',
      ),
    );
  }
}
