import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/financial_insight.dart';

/// Widget for displaying a financial insight card
///
/// Shows insight with appropriate styling based on priority and type
class InsightCard extends StatelessWidget {
  final FinancialInsight insight;
  final VoidCallback? onTap;

  const InsightCard({Key? key, required this.insight, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with icon, priority, and type
              Row(
                children: [
                  // Type icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _getTypeColor(insight.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getTypeIcon(insight.type),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Title
                  Expanded(
                    child: Text(
                      insight.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Priority badge
                  _buildPriorityBadge(context),
                ],
              ),
              const SizedBox(height: 12),
              // Description
              Text(
                insight.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 12),
              // Footer with timestamp and action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.MMMd().add_jm().format(insight.generatedAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  if (insight.actionLink != null)
                    TextButton(
                      onPressed: onTap,
                      child: const Text('Learn More'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build priority badge
  Widget _buildPriorityBadge(BuildContext context) {
    final theme = Theme.of(context);
    final color = _getPriorityColor(insight.priority);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        _getPriorityText(insight.priority),
        style: theme.textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  /// Get color for insight type
  Color _getTypeColor(InsightType type) {
    switch (type) {
      case InsightType.spending:
        return Colors.orange;
      case InsightType.saving:
        return Colors.green;
      case InsightType.budget:
        return Colors.blue;
      case InsightType.goal:
        return Colors.purple;
      case InsightType.anomaly:
        return Colors.red;
      case InsightType.achievement:
        return Colors.amber;
    }
  }

  /// Get icon for insight type
  String _getTypeIcon(InsightType type) {
    switch (type) {
      case InsightType.spending:
        return '💸';
      case InsightType.saving:
        return '💰';
      case InsightType.budget:
        return '📊';
      case InsightType.goal:
        return '🎯';
      case InsightType.anomaly:
        return '⚠️';
      case InsightType.achievement:
        return '🏆';
    }
  }

  /// Get color for priority
  Color _getPriorityColor(InsightPriority priority) {
    switch (priority) {
      case InsightPriority.high:
        return Colors.red;
      case InsightPriority.medium:
        return Colors.orange;
      case InsightPriority.low:
        return Colors.blue;
    }
  }

  /// Get text for priority
  String _getPriorityText(InsightPriority priority) {
    switch (priority) {
      case InsightPriority.high:
        return 'HIGH';
      case InsightPriority.medium:
        return 'MEDIUM';
      case InsightPriority.low:
        return 'LOW';
    }
  }
}
