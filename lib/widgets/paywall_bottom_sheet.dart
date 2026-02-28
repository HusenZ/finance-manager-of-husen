import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../core/constants/app_colors.dart';
import '../core/secrets.dart';
import '../service_locator.dart';
import '../services/subscription_service.dart';

class PaywallBottomSheet extends StatefulWidget {
  const PaywallBottomSheet({super.key, this.reason});

  final String? reason;

  @override
  State<PaywallBottomSheet> createState() => _PaywallBottomSheetState();
}

class _PaywallBottomSheetState extends State<PaywallBottomSheet> {
  final SubscriptionService _subscriptionService = getIt<SubscriptionService>();
  late final Razorpay _razorpay;

  String _billingCycle = 'monthly';
  bool _isLoading = false;
  String? _pendingTier;
  String? _pendingSubscriptionId;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_subscriptionService.isOwner()) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Unlock Premium Features',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (widget.reason != null) ...[
              const SizedBox(height: 8),
              Text(widget.reason!),
            ],
            const SizedBox(height: 16),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'monthly', label: Text('Monthly')),
                ButtonSegment(value: 'annual', label: Text('Annual')),
              ],
              selected: {_billingCycle},
              onSelectionChanged: (value) {
                setState(() {
                  _billingCycle = value.first;
                });
              },
            ),
            const SizedBox(height: 16),
            _PlanCard(
              title: 'Pro',
              price: _billingCycle == 'monthly' ? '₹179/mo' : '₹1099/yr',
              features: const [
                'Cloud sync and multi-device support',
                'Unlimited categories and full history',
                'Analytics and charts',
                'AI assistant (30 messages/month)',
              ],
              cta: 'Start Pro',
              loading: _isLoading,
              onTap: () => _startCheckout('pro'),
            ),
            const SizedBox(height: 12),
            _PlanCard(
              title: 'Premium',
              price: _billingCycle == 'monthly' ? '₹379/mo' : '₹2499/yr',
              features: const [
                'Everything in Pro',
                'Unlimited AI messages',
                'Advanced analytics + CSV/PDF export',
                'Recurring automation and early access',
              ],
              cta: 'Start Premium',
              loading: _isLoading,
              onTap: () => _startCheckout('premium'),
              highlighted: true,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startCheckout(String tier) async {
    if (_isLoading) return;

    if (Secrets.razorpayKeyId.isEmpty) {
      _showMessage('Missing Razorpay key id in lib/core/secrets.dart');
      return;
    }

    try {
      setState(() => _isLoading = true);

      final response = await _subscriptionService.createRazorpaySubscription(
        tier: tier,
        billingCycle: _billingCycle,
      );

      final subscriptionId = response['subscription_id'] as String?;
      if (subscriptionId == null || subscriptionId.isEmpty) {
        _showMessage('Unable to initialize subscription. Try again.');
        return;
      }

      _pendingTier = tier;
      _pendingSubscriptionId = subscriptionId;

      final options = {
        'key': Secrets.razorpayKeyId,
        'subscription_id': subscriptionId,
        'name': 'Finance Manager',
        'description': '${tier.toUpperCase()} ${_billingCycle.toUpperCase()} Plan',
        'retry': {'enabled': true, 'max_count': 2},
      };

      _razorpay.open(options);
    } catch (error) {
      _showMessage('Failed to start checkout: $error');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final paymentId = response.paymentId;
    final signature = response.signature;
    final subscriptionId = _pendingSubscriptionId;
    final tier = _pendingTier;

    if (paymentId == null || signature == null || subscriptionId == null || tier == null) {
      _showMessage('Payment verification failed. Please retry.');
      return;
    }

    try {
      await _subscriptionService.confirmRazorpayPayment(
        tier: tier,
        billingCycle: _billingCycle,
        razorpayPaymentId: paymentId,
        razorpaySubscriptionId: subscriptionId,
        razorpaySignature: signature,
      );

      if (!mounted) return;
      Navigator.of(context).pop(true);
      _showMessage('Subscription activated successfully.');
    } catch (error) {
      _showMessage('Payment verification failed: $error');
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _showMessage(
      'Payment failed (${response.code}): ${response.message ?? 'Unknown error'}. Please retry.',
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _showMessage('External wallet selected: ${response.walletName ?? 'N/A'}');
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.title,
    required this.price,
    required this.features,
    required this.cta,
    required this.loading,
    required this.onTap,
    this.highlighted = false,
  });

  final String title;
  final String price;
  final List<String> features;
  final String cta;
  final bool loading;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final borderColor = highlighted ? AppColors.primary : Colors.grey.shade300;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: highlighted ? 1.5 : 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                price,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(Icons.check_circle, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(feature)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: loading ? null : onTap,
              child: loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(cta),
            ),
          ),
        ],
      ),
    );
  }
}
