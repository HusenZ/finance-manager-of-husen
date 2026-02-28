// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecurringTransactionAdapter extends TypeAdapter<RecurringTransaction> {
  @override
  final int typeId = 4;

  @override
  RecurringTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurringTransaction(
      id: fields[0] as String,
      userId: fields[1] as String,
      amount: fields[2] as double,
      category: fields[3] as String,
      description: fields[4] as String,
      frequency: fields[5] as RecurringFrequency,
      nextDueDate: fields[6] as DateTime,
      isActive: fields[7] as bool,
      paymentMethod: fields[8] as String?,
      notes: fields[9] as String?,
      createdAt: fields[10] as DateTime,
      updatedAt: fields[11] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, RecurringTransaction obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.frequency)
      ..writeByte(6)
      ..write(obj.nextDueDate)
      ..writeByte(7)
      ..write(obj.isActive)
      ..writeByte(8)
      ..write(obj.paymentMethod)
      ..writeByte(9)
      ..write(obj.notes)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurringTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurringTransactionImpl _$$RecurringTransactionImplFromJson(
  Map<String, dynamic> json,
) => _$RecurringTransactionImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  amount: (json['amount'] as num).toDouble(),
  category: json['category'] as String,
  description: json['description'] as String,
  frequency: $enumDecode(_$RecurringFrequencyEnumMap, json['frequency']),
  nextDueDate: DateTime.parse(json['nextDueDate'] as String),
  isActive: json['isActive'] as bool? ?? true,
  paymentMethod: json['paymentMethod'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$RecurringTransactionImplToJson(
  _$RecurringTransactionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'amount': instance.amount,
  'category': instance.category,
  'description': instance.description,
  'frequency': _$RecurringFrequencyEnumMap[instance.frequency]!,
  'nextDueDate': instance.nextDueDate.toIso8601String(),
  'isActive': instance.isActive,
  'paymentMethod': instance.paymentMethod,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$RecurringFrequencyEnumMap = {
  RecurringFrequency.daily: 'daily',
  RecurringFrequency.weekly: 'weekly',
  RecurringFrequency.biweekly: 'biweekly',
  RecurringFrequency.monthly: 'monthly',
  RecurringFrequency.quarterly: 'quarterly',
  RecurringFrequency.yearly: 'yearly',
};
