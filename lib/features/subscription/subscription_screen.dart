import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../service_locator.dart';
import '../../services/subscription_service.dart';
import '../../widgets/paywall_bottom_sheet.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptionService = getIt<SubscriptionService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Subscription')),
      body: AnimatedBuilder(
        animation: subscriptionService,
        builder: (context, _) {
          final current = subscriptionService.current;
          final hasUnlimited = subscriptionService.hasUnlimitedAI();
          final used = current.aiMessagesUsed;
          final remaining = subscriptionService.aiMessagesRemaining();
          final limit = hasUnlimited ? null : SubscriptionService.proAiLimit;
          final progress = hasUnlimited || limit == 0
              ? 0.0
              : (used / limit!).clamp(0.0, 1.0);

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        current.isOwner
                            ? 'Owner Account (Premium)'
                            : 'Current Plan: ${current.tier.toUpperCase()}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Status: ${current.status.toUpperCase()}'),
                      const SizedBox(height: 4),
                      Text(
                        'Billing cycle: ${current.billingCycle?.toUpperCase() ?? 'N/A'}',
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Next billing date: ${current.currentPeriodEnd?.toLocal().toString().split(' ').first ?? 'N/A'}',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Usage',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        hasUnlimited
                            ? 'Unlimited messages'
                            : '$used used, $remaining remaining',
                      ),
                      const SizedBox(height: 8),
                      if (!hasUnlimited)
                        LinearProgressIndicator(
                          value: progress,
                          color: AppColors.primary,
                        ),
                      const SizedBox(height: 6),
                      Text(
                        'Resets on: ${current.aiMessagesResetDate.toLocal().toString().split(' ').first}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (!current.isOwner)
                FilledButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => const PaywallBottomSheet(),
                    );
                  },
                  child: const Text('Upgrade / Change Plan'),
                ),
              if (!current.isOwner &&
                  current.razorpaySubscriptionId != null &&
                  current.status == 'active') ...[
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () async {
                    final confirm =
                        await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Cancel subscription?'),
                            content: const Text(
                              'Your plan will be cancelled at the end of the current billing period.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Keep Plan'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Cancel Subscription'),
                              ),
                            ],
                          ),
                        ) ??
                        false;

                    if (!confirm) return;

                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    try {
                      await subscriptionService.cancelSubscription(
                        current.razorpaySubscriptionId!,
                      );
                      scaffoldMessenger.showSnackBar(
                        const SnackBar(
                          content: Text('Subscription cancellation scheduled.'),
                        ),
                      );
                    } catch (error) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(content: Text('Cancellation failed: $error')),
                      );
                    }
                  },
                  child: const Text('Cancel Subscription'),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
