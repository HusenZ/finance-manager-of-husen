// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinancialInsightImpl _$$FinancialInsightImplFromJson(
        Map<String, dynamic> json) =>
    _$FinancialInsightImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      priority: $enumDecode(_$InsightPriorityEnumMap, json['priority']),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      actionLink: json['actionLink'] as String?,
    );

Map<String, dynamic> _$$FinancialInsightImplToJson(
        _$FinancialInsightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'priority': _$InsightPriorityEnumMap[instance.priority]!,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'actionLink': instance.actionLink,
    };

const _$InsightTypeEnumMap = {
  InsightType.spending: 'spending',
  InsightType.saving: 'saving',
  InsightType.budget: 'budget',
  InsightType.goal: 'goal',
  InsightType.anomaly: 'anomaly',
  InsightType.achievement: 'achievement',
};

const _$InsightPriorityEnumMap = {
  InsightPriority.high: 'high',
  InsightPriority.medium: 'medium',
  InsightPriority.low: 'low',
};
