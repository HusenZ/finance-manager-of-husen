import 'package:flutter/material.dart';

/// Widget for quick action chips in AI chat
///
/// These provide quick access to common AI features
class QuickActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const QuickActionChip({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ActionChip(
      avatar: Icon(icon, size: 18, color: theme.colorScheme.primary),
      label: Text(label, style: TextStyle(color: Colors.white)),
      labelStyle: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: theme.colorScheme.primaryContainer,
      side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.2)),
      onPressed: onTap,
    );
  }
}
