// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AIChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIChatEventCopyWith<$Res> {
  factory $AIChatEventCopyWith(
    AIChatEvent value,
    $Res Function(AIChatEvent) then,
  ) = _$AIChatEventCopyWithImpl<$Res, AIChatEvent>;
}

/// @nodoc
class _$AIChatEventCopyWithImpl<$Res, $Val extends AIChatEvent>
    implements $AIChatEventCopyWith<$Res> {
  _$AIChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendMessageEventImplCopyWith<$Res> {
  factory _$$SendMessageEventImplCopyWith(
    _$SendMessageEventImpl value,
    $Res Function(_$SendMessageEventImpl) then,
  ) = __$$SendMessageEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendMessageEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$SendMessageEventImpl>
    implements _$$SendMessageEventImplCopyWith<$Res> {
  __$$SendMessageEventImplCopyWithImpl(
    _$SendMessageEventImpl _value,
    $Res Function(_$SendMessageEventImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SendMessageEventImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SendMessageEventImpl implements SendMessageEvent {
  const _$SendMessageEventImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AIChatEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageEventImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageEventImplCopyWith<_$SendMessageEventImpl> get copyWith =>
      __$$SendMessageEventImplCopyWithImpl<_$SendMessageEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class SendMessageEvent implements AIChatEvent {
  const factory SendMessageEvent(final String message) = _$SendMessageEventImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SendMessageEventImplCopyWith<_$SendMessageEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadHistoryEventImplCopyWith<$Res> {
  factory _$$LoadHistoryEventImplCopyWith(
    _$LoadHistoryEventImpl value,
    $Res Function(_$LoadHistoryEventImpl) then,
  ) = __$$LoadHistoryEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHistoryEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$LoadHistoryEventImpl>
    implements _$$LoadHistoryEventImplCopyWith<$Res> {
  __$$LoadHistoryEventImplCopyWithImpl(
    _$LoadHistoryEventImpl _value,
    $Res Function(_$LoadHistoryEventImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$LoadHistoryEventImpl implements LoadHistoryEvent {
  const _$LoadHistoryEventImpl();

  @override
  String toString() {
    return 'AIChatEvent.loadHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadHistoryEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return loadHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return loadHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return loadHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return loadHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory(this);
    }
    return orElse();
  }
}

abstract class LoadHistoryEvent implements AIChatEvent {
  const factory LoadHistoryEvent() = _$LoadHistoryEventImpl;
}

/// @nodoc
abstract class _$$ClearHistoryEventImplCopyWith<$Res> {
  factory _$$ClearHistoryEventImplCopyWith(
    _$ClearHistoryEventImpl value,
    $Res Function(_$ClearHistoryEventImpl) then,
  ) = __$$ClearHistoryEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearHistoryEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$ClearHistoryEventImpl>
    implements _$$ClearHistoryEventImplCopyWith<$Res> {
  __$$ClearHistoryEventImplCopyWithImpl(
    _$ClearHistoryEventImpl _value,
    $Res Function(_$ClearHistoryEventImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$ClearHistoryEventImpl implements ClearHistoryEvent {
  const _$ClearHistoryEventImpl();

  @override
  String toString() {
    return 'AIChatEvent.clearHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearHistoryEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return clearHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return clearHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (clearHistory != null) {
      return clearHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return clearHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return clearHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (clearHistory != null) {
      return clearHistory(this);
    }
    return orElse();
  }
}

abstract class ClearHistoryEvent implements AIChatEvent {
  const factory ClearHistoryEvent() = _$ClearHistoryEventImpl;
}

/// @nodoc
abstract class _$$CategorizeExpenseEventImplCopyWith<$Res> {
  factory _$$CategorizeExpenseEventImplCopyWith(
    _$CategorizeExpenseEventImpl value,
    $Res Function(_$CategorizeExpenseEventImpl) then,
  ) = __$$CategorizeExpenseEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$CategorizeExpenseEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$CategorizeExpenseEventImpl>
    implements _$$CategorizeExpenseEventImplCopyWith<$Res> {
  __$$CategorizeExpenseEventImplCopyWithImpl(
    _$CategorizeExpenseEventImpl _value,
    $Res Function(_$CategorizeExpenseEventImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null}) {
    return _then(
      _$CategorizeExpenseEventImpl(
        null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CategorizeExpenseEventImpl implements CategorizeExpenseEvent {
  const _$CategorizeExpenseEventImpl(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'AIChatEvent.categorizeExpense(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorizeExpenseEventImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorizeExpenseEventImplCopyWith<_$CategorizeExpenseEventImpl>
  get copyWith =>
      __$$CategorizeExpenseEventImplCopyWithImpl<_$CategorizeExpenseEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return categorizeExpense(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return categorizeExpense?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (categorizeExpense != null) {
      return categorizeExpense(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return categorizeExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return categorizeExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (categorizeExpense != null) {
      return categorizeExpense(this);
    }
    return orElse();
  }
}

abstract class CategorizeExpenseEvent implements AIChatEvent {
  const factory CategorizeExpenseEvent(final String description) =
      _$CategorizeExpenseEventImpl;

  String get description;
  @JsonKey(ignore: true)
  _$$CategorizeExpenseEventImplCopyWith<_$CategorizeExpenseEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateInsightsEventImplCopyWith<$Res> {
  factory _$$GenerateInsightsEventImplCopyWith(
    _$GenerateInsightsEventImpl value,
    $Res Function(_$GenerateInsightsEventImpl) then,
  ) = __$$GenerateInsightsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerateInsightsEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$GenerateInsightsEventImpl>
    implements _$$GenerateInsightsEventImplCopyWith<$Res> {
  __$$GenerateInsightsEventImplCopyWithImpl(
    _$GenerateInsightsEventImpl _value,
    $Res Function(_$GenerateInsightsEventImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$GenerateInsightsEventImpl implements GenerateInsightsEvent {
  const _$GenerateInsightsEventImpl();

  @override
  String toString() {
    return 'AIChatEvent.generateInsights()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateInsightsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return generateInsights();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return generateInsights?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (generateInsights != null) {
      return generateInsights();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return generateInsights(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return generateInsights?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (generateInsights != null) {
      return generateInsights(this);
    }
    return orElse();
  }
}

abstract class GenerateInsightsEvent implements AIChatEvent {
  const factory GenerateInsightsEvent() = _$GenerateInsightsEventImpl;
}

/// @nodoc
abstract class _$$GetPurchaseAdviceEventImplCopyWith<$Res> {
  factory _$$GetPurchaseAdviceEventImplCopyWith(
    _$GetPurchaseAdviceEventImpl value,
    $Res Function(_$GetPurchaseAdviceEventImpl) then,
  ) = __$$GetPurchaseAdviceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemName, double itemPrice});
}

/// @nodoc
class __$$GetPurchaseAdviceEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$GetPurchaseAdviceEventImpl>
    implements _$$GetPurchaseAdviceEventImplCopyWith<$Res> {
  __$$GetPurchaseAdviceEventImplCopyWithImpl(
    _$GetPurchaseAdviceEventImpl _value,
    $Res Function(_$GetPurchaseAdviceEventImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? itemName = null, Object? itemPrice = null}) {
    return _then(
      _$GetPurchaseAdviceEventImpl(
        itemName: null == itemName
            ? _value.itemName
            : itemName // ignore: cast_nullable_to_non_nullable
                  as String,
        itemPrice: null == itemPrice
            ? _value.itemPrice
            : itemPrice // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$GetPurchaseAdviceEventImpl implements GetPurchaseAdviceEvent {
  const _$GetPurchaseAdviceEventImpl({
    required this.itemName,
    required this.itemPrice,
  });

  @override
  final String itemName;
  @override
  final double itemPrice;

  @override
  String toString() {
    return 'AIChatEvent.getPurchaseAdvice(itemName: $itemName, itemPrice: $itemPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPurchaseAdviceEventImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemName, itemPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPurchaseAdviceEventImplCopyWith<_$GetPurchaseAdviceEventImpl>
  get copyWith =>
      __$$GetPurchaseAdviceEventImplCopyWithImpl<_$GetPurchaseAdviceEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return getPurchaseAdvice(itemName, itemPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return getPurchaseAdvice?.call(itemName, itemPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (getPurchaseAdvice != null) {
      return getPurchaseAdvice(itemName, itemPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return getPurchaseAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return getPurchaseAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (getPurchaseAdvice != null) {
      return getPurchaseAdvice(this);
    }
    return orElse();
  }
}

abstract class GetPurchaseAdviceEvent implements AIChatEvent {
  const factory GetPurchaseAdviceEvent({
    required final String itemName,
    required final double itemPrice,
  }) = _$GetPurchaseAdviceEventImpl;

  String get itemName;
  double get itemPrice;
  @JsonKey(ignore: true)
  _$$GetPurchaseAdviceEventImplCopyWith<_$GetPurchaseAdviceEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshFinancialContextEventImplCopyWith<$Res> {
  factory _$$RefreshFinancialContextEventImplCopyWith(
    _$RefreshFinancialContextEventImpl value,
    $Res Function(_$RefreshFinancialContextEventImpl) then,
  ) = __$$RefreshFinancialContextEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshFinancialContextEventImplCopyWithImpl<$Res>
    extends _$AIChatEventCopyWithImpl<$Res, _$RefreshFinancialContextEventImpl>
    implements _$$RefreshFinancialContextEventImplCopyWith<$Res> {
  __$$RefreshFinancialContextEventImplCopyWithImpl(
    _$RefreshFinancialContextEventImpl _value,
    $Res Function(_$RefreshFinancialContextEventImpl) _then,
  ) : super(_value, _then);
}

/// @nodoc

class _$RefreshFinancialContextEventImpl
    implements RefreshFinancialContextEvent {
  const _$RefreshFinancialContextEventImpl();

  @override
  String toString() {
    return 'AIChatEvent.refreshFinancialContext()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshFinancialContextEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) sendMessage,
    required TResult Function() loadHistory,
    required TResult Function() clearHistory,
    required TResult Function(String description) categorizeExpense,
    required TResult Function() generateInsights,
    required TResult Function(String itemName, double itemPrice)
    getPurchaseAdvice,
    required TResult Function() refreshFinancialContext,
  }) {
    return refreshFinancialContext();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? sendMessage,
    TResult? Function()? loadHistory,
    TResult? Function()? clearHistory,
    TResult? Function(String description)? categorizeExpense,
    TResult? Function()? generateInsights,
    TResult? Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult? Function()? refreshFinancialContext,
  }) {
    return refreshFinancialContext?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? sendMessage,
    TResult Function()? loadHistory,
    TResult Function()? clearHistory,
    TResult Function(String description)? categorizeExpense,
    TResult Function()? generateInsights,
    TResult Function(String itemName, double itemPrice)? getPurchaseAdvice,
    TResult Function()? refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (refreshFinancialContext != null) {
      return refreshFinancialContext();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEvent value) sendMessage,
    required TResult Function(LoadHistoryEvent value) loadHistory,
    required TResult Function(ClearHistoryEvent value) clearHistory,
    required TResult Function(CategorizeExpenseEvent value) categorizeExpense,
    required TResult Function(GenerateInsightsEvent value) generateInsights,
    required TResult Function(GetPurchaseAdviceEvent value) getPurchaseAdvice,
    required TResult Function(RefreshFinancialContextEvent value)
    refreshFinancialContext,
  }) {
    return refreshFinancialContext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEvent value)? sendMessage,
    TResult? Function(LoadHistoryEvent value)? loadHistory,
    TResult? Function(ClearHistoryEvent value)? clearHistory,
    TResult? Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult? Function(GenerateInsightsEvent value)? generateInsights,
    TResult? Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult? Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
  }) {
    return refreshFinancialContext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEvent value)? sendMessage,
    TResult Function(LoadHistoryEvent value)? loadHistory,
    TResult Function(ClearHistoryEvent value)? clearHistory,
    TResult Function(CategorizeExpenseEvent value)? categorizeExpense,
    TResult Function(GenerateInsightsEvent value)? generateInsights,
    TResult Function(GetPurchaseAdviceEvent value)? getPurchaseAdvice,
    TResult Function(RefreshFinancialContextEvent value)?
    refreshFinancialContext,
    required TResult orElse(),
  }) {
    if (refreshFinancialContext != null) {
      return refreshFinancialContext(this);
    }
    return orElse();
  }
}

abstract class RefreshFinancialContextEvent implements AIChatEvent {
  const factory RefreshFinancialContextEvent() =
      _$RefreshFinancialContextEventImpl;
}
