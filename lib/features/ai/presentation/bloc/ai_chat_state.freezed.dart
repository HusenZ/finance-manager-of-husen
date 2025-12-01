// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AIChatState {
  List<AIMessage> get messages => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AIChatStateCopyWith<AIChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIChatStateCopyWith<$Res> {
  factory $AIChatStateCopyWith(
          AIChatState value, $Res Function(AIChatState) then) =
      _$AIChatStateCopyWithImpl<$Res, AIChatState>;
  @useResult
  $Res call({List<AIMessage> messages});
}

/// @nodoc
class _$AIChatStateCopyWithImpl<$Res, $Val extends AIChatState>
    implements $AIChatStateCopyWith<$Res> {
  _$AIChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<$Res>
    implements $AIChatStateCopyWith<$Res> {
  factory _$$InitialStateImplCopyWith(
          _$InitialStateImpl value, $Res Function(_$InitialStateImpl) then) =
      __$$InitialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AIMessage> messages});
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<$Res>
    extends _$AIChatStateCopyWithImpl<$Res, _$InitialStateImpl>
    implements _$$InitialStateImplCopyWith<$Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl _value, $Res Function(_$InitialStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$InitialStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ));
  }
}

/// @nodoc

class _$InitialStateImpl implements InitialState {
  const _$InitialStateImpl({final List<AIMessage> messages = const []})
      : _messages = messages;

  final List<AIMessage> _messages;
  @override
  @JsonKey()
  List<AIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'AIChatState.initial(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      __$$InitialStateImplCopyWithImpl<_$InitialStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) {
    return initial(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) {
    return initial?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements AIChatState {
  const factory InitialState({final List<AIMessage> messages}) =
      _$InitialStateImpl;

  @override
  List<AIMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$InitialStateImplCopyWith<_$InitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res>
    implements $AIChatStateCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AIMessage> messages});
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$AIChatStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$LoadingStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ));
  }
}

/// @nodoc

class _$LoadingStateImpl implements LoadingState {
  const _$LoadingStateImpl({required final List<AIMessage> messages})
      : _messages = messages;

  final List<AIMessage> _messages;
  @override
  List<AIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'AIChatState.loading(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingStateImplCopyWith<_$LoadingStateImpl> get copyWith =>
      __$$LoadingStateImplCopyWithImpl<_$LoadingStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) {
    return loading(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) {
    return loading?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements AIChatState {
  const factory LoadingState({required final List<AIMessage> messages}) =
      _$LoadingStateImpl;

  @override
  List<AIMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$LoadingStateImplCopyWith<_$LoadingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessStateImplCopyWith<$Res>
    implements $AIChatStateCopyWith<$Res> {
  factory _$$SuccessStateImplCopyWith(
          _$SuccessStateImpl value, $Res Function(_$SuccessStateImpl) then) =
      __$$SuccessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AIMessage> messages});
}

/// @nodoc
class __$$SuccessStateImplCopyWithImpl<$Res>
    extends _$AIChatStateCopyWithImpl<$Res, _$SuccessStateImpl>
    implements _$$SuccessStateImplCopyWith<$Res> {
  __$$SuccessStateImplCopyWithImpl(
      _$SuccessStateImpl _value, $Res Function(_$SuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$SuccessStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ));
  }
}

/// @nodoc

class _$SuccessStateImpl implements SuccessState {
  const _$SuccessStateImpl({required final List<AIMessage> messages})
      : _messages = messages;

  final List<AIMessage> _messages;
  @override
  List<AIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'AIChatState.success(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      __$$SuccessStateImplCopyWithImpl<_$SuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) {
    return success(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) {
    return success?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements AIChatState {
  const factory SuccessState({required final List<AIMessage> messages}) =
      _$SuccessStateImpl;

  @override
  List<AIMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$SuccessStateImplCopyWith<_$SuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res>
    implements $AIChatStateCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<AIMessage> messages});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$AIChatStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? messages = null,
  }) {
    return _then(_$ErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements ErrorState {
  const _$ErrorStateImpl(
      {required this.message, required final List<AIMessage> messages})
      : _messages = messages;

  @override
  final String message;
  final List<AIMessage> _messages;
  @override
  List<AIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'AIChatState.error(message: $message, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) {
    return error(message, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) {
    return error?.call(message, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements AIChatState {
  const factory ErrorState(
      {required final String message,
      required final List<AIMessage> messages}) = _$ErrorStateImpl;

  String get message;
  @override
  List<AIMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategorySuggestedStateImplCopyWith<$Res>
    implements $AIChatStateCopyWith<$Res> {
  factory _$$CategorySuggestedStateImplCopyWith(
          _$CategorySuggestedStateImpl value,
          $Res Function(_$CategorySuggestedStateImpl) then) =
      __$$CategorySuggestedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, List<AIMessage> messages});
}

/// @nodoc
class __$$CategorySuggestedStateImplCopyWithImpl<$Res>
    extends _$AIChatStateCopyWithImpl<$Res, _$CategorySuggestedStateImpl>
    implements _$$CategorySuggestedStateImplCopyWith<$Res> {
  __$$CategorySuggestedStateImplCopyWithImpl(
      _$CategorySuggestedStateImpl _value,
      $Res Function(_$CategorySuggestedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? messages = null,
  }) {
    return _then(_$CategorySuggestedStateImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ));
  }
}

/// @nodoc

class _$CategorySuggestedStateImpl implements CategorySuggestedState {
  const _$CategorySuggestedStateImpl(
      {required this.category, required final List<AIMessage> messages})
      : _messages = messages;

  @override
  final String category;
  final List<AIMessage> _messages;
  @override
  List<AIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'AIChatState.categorySuggested(category: $category, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySuggestedStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySuggestedStateImplCopyWith<_$CategorySuggestedStateImpl>
      get copyWith => __$$CategorySuggestedStateImplCopyWithImpl<
          _$CategorySuggestedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) {
    return categorySuggested(category, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) {
    return categorySuggested?.call(category, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) {
    if (categorySuggested != null) {
      return categorySuggested(category, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) {
    return categorySuggested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) {
    return categorySuggested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) {
    if (categorySuggested != null) {
      return categorySuggested(this);
    }
    return orElse();
  }
}

abstract class CategorySuggestedState implements AIChatState {
  const factory CategorySuggestedState(
      {required final String category,
      required final List<AIMessage> messages}) = _$CategorySuggestedStateImpl;

  String get category;
  @override
  List<AIMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$CategorySuggestedStateImplCopyWith<_$CategorySuggestedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InsightsGeneratedStateImplCopyWith<$Res>
    implements $AIChatStateCopyWith<$Res> {
  factory _$$InsightsGeneratedStateImplCopyWith(
          _$InsightsGeneratedStateImpl value,
          $Res Function(_$InsightsGeneratedStateImpl) then) =
      __$$InsightsGeneratedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FinancialInsight> insights, List<AIMessage> messages});
}

/// @nodoc
class __$$InsightsGeneratedStateImplCopyWithImpl<$Res>
    extends _$AIChatStateCopyWithImpl<$Res, _$InsightsGeneratedStateImpl>
    implements _$$InsightsGeneratedStateImplCopyWith<$Res> {
  __$$InsightsGeneratedStateImplCopyWithImpl(
      _$InsightsGeneratedStateImpl _value,
      $Res Function(_$InsightsGeneratedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insights = null,
    Object? messages = null,
  }) {
    return _then(_$InsightsGeneratedStateImpl(
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<FinancialInsight>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<AIMessage>,
    ));
  }
}

/// @nodoc

class _$InsightsGeneratedStateImpl implements InsightsGeneratedState {
  const _$InsightsGeneratedStateImpl(
      {required final List<FinancialInsight> insights,
      required final List<AIMessage> messages})
      : _insights = insights,
        _messages = messages;

  final List<FinancialInsight> _insights;
  @override
  List<FinancialInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  final List<AIMessage> _messages;
  @override
  List<AIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'AIChatState.insightsGenerated(insights: $insights, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightsGeneratedStateImpl &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_insights),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightsGeneratedStateImplCopyWith<_$InsightsGeneratedStateImpl>
      get copyWith => __$$InsightsGeneratedStateImplCopyWithImpl<
          _$InsightsGeneratedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<AIMessage> messages) initial,
    required TResult Function(List<AIMessage> messages) loading,
    required TResult Function(List<AIMessage> messages) success,
    required TResult Function(String message, List<AIMessage> messages) error,
    required TResult Function(String category, List<AIMessage> messages)
        categorySuggested,
    required TResult Function(
            List<FinancialInsight> insights, List<AIMessage> messages)
        insightsGenerated,
  }) {
    return insightsGenerated(insights, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<AIMessage> messages)? initial,
    TResult? Function(List<AIMessage> messages)? loading,
    TResult? Function(List<AIMessage> messages)? success,
    TResult? Function(String message, List<AIMessage> messages)? error,
    TResult? Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult? Function(
            List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
  }) {
    return insightsGenerated?.call(insights, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<AIMessage> messages)? initial,
    TResult Function(List<AIMessage> messages)? loading,
    TResult Function(List<AIMessage> messages)? success,
    TResult Function(String message, List<AIMessage> messages)? error,
    TResult Function(String category, List<AIMessage> messages)?
        categorySuggested,
    TResult Function(List<FinancialInsight> insights, List<AIMessage> messages)?
        insightsGenerated,
    required TResult orElse(),
  }) {
    if (insightsGenerated != null) {
      return insightsGenerated(insights, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SuccessState value) success,
    required TResult Function(ErrorState value) error,
    required TResult Function(CategorySuggestedState value) categorySuggested,
    required TResult Function(InsightsGeneratedState value) insightsGenerated,
  }) {
    return insightsGenerated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState value)? initial,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SuccessState value)? success,
    TResult? Function(ErrorState value)? error,
    TResult? Function(CategorySuggestedState value)? categorySuggested,
    TResult? Function(InsightsGeneratedState value)? insightsGenerated,
  }) {
    return insightsGenerated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(SuccessState value)? success,
    TResult Function(ErrorState value)? error,
    TResult Function(CategorySuggestedState value)? categorySuggested,
    TResult Function(InsightsGeneratedState value)? insightsGenerated,
    required TResult orElse(),
  }) {
    if (insightsGenerated != null) {
      return insightsGenerated(this);
    }
    return orElse();
  }
}

abstract class InsightsGeneratedState implements AIChatState {
  const factory InsightsGeneratedState(
      {required final List<FinancialInsight> insights,
      required final List<AIMessage> messages}) = _$InsightsGeneratedStateImpl;

  List<FinancialInsight> get insights;
  @override
  List<AIMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$InsightsGeneratedStateImplCopyWith<_$InsightsGeneratedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
