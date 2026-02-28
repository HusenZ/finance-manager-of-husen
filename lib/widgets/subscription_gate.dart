import 'package:flutter/material.dart';

import '../service_locator.dart';
import '../services/subscription_service.dart';
import 'paywall_bottom_sheet.dart';

class SubscriptionGate extends StatefulWidget {
  const SubscriptionGate({
    super.key,
    required this.requiredTier,
    required this.child,
    this.reason,
  });

  final String requiredTier;
  final Widget child;
  final String? reason;

  @override
  State<SubscriptionGate> createState() => _SubscriptionGateState();
}

class _SubscriptionGateState extends State<SubscriptionGate> {
  final SubscriptionService _subscriptionService = getIt<SubscriptionService>();
  bool _didShowPaywall = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _subscriptionService,
      builder: (context, _) {
        if (_subscriptionService.hasTier(widget.requiredTier)) {
          _didShowPaywall = false;
          return widget.child;
        }

        if (!_didShowPaywall && !_subscriptionService.isOwner()) {
          _didShowPaywall = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (_) => PaywallBottomSheet(reason: widget.reason),
            );
          });
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_outline, size: 56),
                const SizedBox(height: 16),
                Text(
                  'This feature is available on ${widget.requiredTier.toUpperCase()} and above.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.reason ?? 'Upgrade to continue.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => PaywallBottomSheet(reason: widget.reason),
                    );
                  },
                  child: const Text('View Plans'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
