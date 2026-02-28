// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financial_insight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FinancialInsight _$FinancialInsightFromJson(Map<String, dynamic> json) {
  return _FinancialInsight.fromJson(json);
}

/// @nodoc
mixin _$FinancialInsight {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  InsightPriority get priority => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  String? get actionLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialInsightCopyWith<FinancialInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialInsightCopyWith<$Res> {
  factory $FinancialInsightCopyWith(
    FinancialInsight value,
    $Res Function(FinancialInsight) then,
  ) = _$FinancialInsightCopyWithImpl<$Res, FinancialInsight>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    InsightType type,
    InsightPriority priority,
    DateTime generatedAt,
    String? actionLink,
  });
}

/// @nodoc
class _$FinancialInsightCopyWithImpl<$Res, $Val extends FinancialInsight>
    implements $FinancialInsightCopyWith<$Res> {
  _$FinancialInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? generatedAt = null,
    Object? actionLink = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as InsightType,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as InsightPriority,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            actionLink: freezed == actionLink
                ? _value.actionLink
                : actionLink // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FinancialInsightImplCopyWith<$Res>
    implements $FinancialInsightCopyWith<$Res> {
  factory _$$FinancialInsightImplCopyWith(
    _$FinancialInsightImpl value,
    $Res Function(_$FinancialInsightImpl) then,
  ) = __$$FinancialInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    InsightType type,
    InsightPriority priority,
    DateTime generatedAt,
    String? actionLink,
  });
}

/// @nodoc
class __$$FinancialInsightImplCopyWithImpl<$Res>
    extends _$FinancialInsightCopyWithImpl<$Res, _$FinancialInsightImpl>
    implements _$$FinancialInsightImplCopyWith<$Res> {
  __$$FinancialInsightImplCopyWithImpl(
    _$FinancialInsightImpl _value,
    $Res Function(_$FinancialInsightImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? generatedAt = null,
    Object? actionLink = freezed,
  }) {
    return _then(
      _$FinancialInsightImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as InsightType,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as InsightPriority,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        actionLink: freezed == actionLink
            ? _value.actionLink
            : actionLink // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialInsightImpl implements _FinancialInsight {
  const _$FinancialInsightImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.priority,
    required this.generatedAt,
    this.actionLink,
  });

  factory _$FinancialInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialInsightImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final InsightType type;
  @override
  final InsightPriority priority;
  @override
  final DateTime generatedAt;
  @override
  final String? actionLink;

  @override
  String toString() {
    return 'FinancialInsight(id: $id, title: $title, description: $description, type: $type, priority: $priority, generatedAt: $generatedAt, actionLink: $actionLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.actionLink, actionLink) ||
                other.actionLink == actionLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    type,
    priority,
    generatedAt,
    actionLink,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialInsightImplCopyWith<_$FinancialInsightImpl> get copyWith =>
      __$$FinancialInsightImplCopyWithImpl<_$FinancialInsightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialInsightImplToJson(this);
  }
}

abstract class _FinancialInsight implements FinancialInsight {
  const factory _FinancialInsight({
    required final String id,
    required final String title,
    required final String description,
    required final InsightType type,
    required final InsightPriority priority,
    required final DateTime generatedAt,
    final String? actionLink,
  }) = _$FinancialInsightImpl;

  factory _FinancialInsight.fromJson(Map<String, dynamic> json) =
      _$FinancialInsightImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  InsightType get type;
  @override
  InsightPriority get priority;
  @override
  DateTime get generatedAt;
  @override
  String? get actionLink;
  @override
  @JsonKey(ignore: true)
  _$$FinancialInsightImplCopyWith<_$FinancialInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
