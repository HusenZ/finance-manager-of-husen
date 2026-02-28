// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinancialContextImpl _$$FinancialContextImplFromJson(
  Map<String, dynamic> json,
) => _$FinancialContextImpl(
  totalIncome: (json['totalIncome'] as num).toDouble(),
  totalExpenses: (json['totalExpenses'] as num).toDouble(),
  savings: (json['savings'] as num).toDouble(),
  savingsRate: (json['savingsRate'] as num).toDouble(),
  categoryBreakdown: (json['categoryBreakdown'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  topSpendingCategories: (json['topSpendingCategories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  incomeSourceBreakdown: (json['incomeSourceBreakdown'] as Map<String, dynamic>)
      .map((k, e) => MapEntry(k, (e as num).toDouble())),
  transactionCount: (json['transactionCount'] as num).toInt(),
  periodStart: DateTime.parse(json['periodStart'] as String),
  periodEnd: DateTime.parse(json['periodEnd'] as String),
);

Map<String, dynamic> _$$FinancialContextImplToJson(
  _$FinancialContextImpl instance,
) => <String, dynamic>{
  'totalIncome': instance.totalIncome,
  'totalExpenses': instance.totalExpenses,
  'savings': instance.savings,
  'savingsRate': instance.savingsRate,
  'categoryBreakdown': instance.categoryBreakdown,
  'topSpendingCategories': instance.topSpendingCategories,
  'incomeSourceBreakdown': instance.incomeSourceBreakdown,
  'transactionCount': instance.transactionCount,
  'periodStart': instance.periodStart.toIso8601String(),
  'periodEnd': instance.periodEnd.toIso8601String(),
};
