// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadCategories,
    required TResult Function(
      String userId,
      String name,
      String icon,
      String color,
    )
    createCategory,
    required TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )
    updateCategory,
    required TResult Function(String userId, String categoryId) deleteCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadCategories,
    TResult? Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult? Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult? Function(String userId, String categoryId)? deleteCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadCategories,
    TResult Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult Function(String userId, String categoryId)? deleteCategory,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(CreateCategory value) createCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(CreateCategory value)? createCategory,
    TResult? Function(UpdateCategory value)? updateCategory,
    TResult? Function(DeleteCategory value)? deleteCategory,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(CreateCategory value)? createCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryEventCopyWith<CategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
    CategoryEvent value,
    $Res Function(CategoryEvent) then,
  ) = _$CategoryEventCopyWithImpl<$Res, CategoryEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res, $Val extends CategoryEvent>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadCategoriesImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$LoadCategoriesImplCopyWith(
    _$LoadCategoriesImpl value,
    $Res Function(_$LoadCategoriesImpl) then,
  ) = __$$LoadCategoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadCategoriesImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$LoadCategoriesImpl>
    implements _$$LoadCategoriesImplCopyWith<$Res> {
  __$$LoadCategoriesImplCopyWithImpl(
    _$LoadCategoriesImpl _value,
    $Res Function(_$LoadCategoriesImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$LoadCategoriesImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadCategoriesImpl implements LoadCategories {
  const _$LoadCategoriesImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CategoryEvent.loadCategories(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCategoriesImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCategoriesImplCopyWith<_$LoadCategoriesImpl> get copyWith =>
      __$$LoadCategoriesImplCopyWithImpl<_$LoadCategoriesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadCategories,
    required TResult Function(
      String userId,
      String name,
      String icon,
      String color,
    )
    createCategory,
    required TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )
    updateCategory,
    required TResult Function(String userId, String categoryId) deleteCategory,
  }) {
    return loadCategories(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadCategories,
    TResult? Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult? Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult? Function(String userId, String categoryId)? deleteCategory,
  }) {
    return loadCategories?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadCategories,
    TResult Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult Function(String userId, String categoryId)? deleteCategory,
    required TResult orElse(),
  }) {
    if (loadCategories != null) {
      return loadCategories(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(CreateCategory value) createCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
  }) {
    return loadCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(CreateCategory value)? createCategory,
    TResult? Function(UpdateCategory value)? updateCategory,
    TResult? Function(DeleteCategory value)? deleteCategory,
  }) {
    return loadCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(CreateCategory value)? createCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (loadCategories != null) {
      return loadCategories(this);
    }
    return orElse();
  }
}

abstract class LoadCategories implements CategoryEvent {
  const factory LoadCategories({required final String userId}) =
      _$LoadCategoriesImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$LoadCategoriesImplCopyWith<_$LoadCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCategoryImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$CreateCategoryImplCopyWith(
    _$CreateCategoryImpl value,
    $Res Function(_$CreateCategoryImpl) then,
  ) = __$$CreateCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, String icon, String color});
}

/// @nodoc
class __$$CreateCategoryImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$CreateCategoryImpl>
    implements _$$CreateCategoryImplCopyWith<$Res> {
  __$$CreateCategoryImplCopyWithImpl(
    _$CreateCategoryImpl _value,
    $Res Function(_$CreateCategoryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
  }) {
    return _then(
      _$CreateCategoryImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CreateCategoryImpl implements CreateCategory {
  const _$CreateCategoryImpl({
    required this.userId,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  final String userId;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String color;

  @override
  String toString() {
    return 'CategoryEvent.createCategory(userId: $userId, name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCategoryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, name, icon, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCategoryImplCopyWith<_$CreateCategoryImpl> get copyWith =>
      __$$CreateCategoryImplCopyWithImpl<_$CreateCategoryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadCategories,
    required TResult Function(
      String userId,
      String name,
      String icon,
      String color,
    )
    createCategory,
    required TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )
    updateCategory,
    required TResult Function(String userId, String categoryId) deleteCategory,
  }) {
    return createCategory(userId, name, icon, color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadCategories,
    TResult? Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult? Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult? Function(String userId, String categoryId)? deleteCategory,
  }) {
    return createCategory?.call(userId, name, icon, color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadCategories,
    TResult Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult Function(String userId, String categoryId)? deleteCategory,
    required TResult orElse(),
  }) {
    if (createCategory != null) {
      return createCategory(userId, name, icon, color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(CreateCategory value) createCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
  }) {
    return createCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(CreateCategory value)? createCategory,
    TResult? Function(UpdateCategory value)? updateCategory,
    TResult? Function(DeleteCategory value)? deleteCategory,
  }) {
    return createCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(CreateCategory value)? createCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (createCategory != null) {
      return createCategory(this);
    }
    return orElse();
  }
}

abstract class CreateCategory implements CategoryEvent {
  const factory CreateCategory({
    required final String userId,
    required final String name,
    required final String icon,
    required final String color,
  }) = _$CreateCategoryImpl;

  @override
  String get userId;
  String get name;
  String get icon;
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$CreateCategoryImplCopyWith<_$CreateCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCategoryImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$UpdateCategoryImplCopyWith(
    _$UpdateCategoryImpl value,
    $Res Function(_$UpdateCategoryImpl) then,
  ) = __$$UpdateCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    String icon,
    String color,
    bool isCustom,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$UpdateCategoryImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$UpdateCategoryImpl>
    implements _$$UpdateCategoryImplCopyWith<$Res> {
  __$$UpdateCategoryImplCopyWithImpl(
    _$UpdateCategoryImpl _value,
    $Res Function(_$UpdateCategoryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? icon = null,
    Object? color = null,
    Object? isCustom = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$UpdateCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        isCustom: null == isCustom
            ? _value.isCustom
            : isCustom // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$UpdateCategoryImpl implements UpdateCategory {
  const _$UpdateCategoryImpl({
    required this.id,
    required this.userId,
    required this.name,
    required this.icon,
    required this.color,
    required this.isCustom,
    required this.createdAt,
  });

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String color;
  @override
  final bool isCustom;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CategoryEvent.updateCategory(id: $id, userId: $userId, name: $name, icon: $icon, color: $color, isCustom: $isCustom, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    name,
    icon,
    color,
    isCustom,
    createdAt,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCategoryImplCopyWith<_$UpdateCategoryImpl> get copyWith =>
      __$$UpdateCategoryImplCopyWithImpl<_$UpdateCategoryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadCategories,
    required TResult Function(
      String userId,
      String name,
      String icon,
      String color,
    )
    createCategory,
    required TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )
    updateCategory,
    required TResult Function(String userId, String categoryId) deleteCategory,
  }) {
    return updateCategory(id, userId, name, icon, color, isCustom, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadCategories,
    TResult? Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult? Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult? Function(String userId, String categoryId)? deleteCategory,
  }) {
    return updateCategory?.call(
      id,
      userId,
      name,
      icon,
      color,
      isCustom,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadCategories,
    TResult Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult Function(String userId, String categoryId)? deleteCategory,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(id, userId, name, icon, color, isCustom, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(CreateCategory value) createCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
  }) {
    return updateCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(CreateCategory value)? createCategory,
    TResult? Function(UpdateCategory value)? updateCategory,
    TResult? Function(DeleteCategory value)? deleteCategory,
  }) {
    return updateCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(CreateCategory value)? createCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(this);
    }
    return orElse();
  }
}

abstract class UpdateCategory implements CategoryEvent {
  const factory UpdateCategory({
    required final String id,
    required final String userId,
    required final String name,
    required final String icon,
    required final String color,
    required final bool isCustom,
    required final DateTime createdAt,
  }) = _$UpdateCategoryImpl;

  String get id;
  @override
  String get userId;
  String get name;
  String get icon;
  String get color;
  bool get isCustom;
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCategoryImplCopyWith<_$UpdateCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCategoryImplCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$DeleteCategoryImplCopyWith(
    _$DeleteCategoryImpl value,
    $Res Function(_$DeleteCategoryImpl) then,
  ) = __$$DeleteCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String categoryId});
}

/// @nodoc
class __$$DeleteCategoryImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$DeleteCategoryImpl>
    implements _$$DeleteCategoryImplCopyWith<$Res> {
  __$$DeleteCategoryImplCopyWithImpl(
    _$DeleteCategoryImpl _value,
    $Res Function(_$DeleteCategoryImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? categoryId = null}) {
    return _then(
      _$DeleteCategoryImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteCategoryImpl implements DeleteCategory {
  const _$DeleteCategoryImpl({required this.userId, required this.categoryId});

  @override
  final String userId;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'CategoryEvent.deleteCategory(userId: $userId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCategoryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCategoryImplCopyWith<_$DeleteCategoryImpl> get copyWith =>
      __$$DeleteCategoryImplCopyWithImpl<_$DeleteCategoryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadCategories,
    required TResult Function(
      String userId,
      String name,
      String icon,
      String color,
    )
    createCategory,
    required TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )
    updateCategory,
    required TResult Function(String userId, String categoryId) deleteCategory,
  }) {
    return deleteCategory(userId, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadCategories,
    TResult? Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult? Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult? Function(String userId, String categoryId)? deleteCategory,
  }) {
    return deleteCategory?.call(userId, categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadCategories,
    TResult Function(String userId, String name, String icon, String color)?
    createCategory,
    TResult Function(
      String id,
      String userId,
      String name,
      String icon,
      String color,
      bool isCustom,
      DateTime createdAt,
    )?
    updateCategory,
    TResult Function(String userId, String categoryId)? deleteCategory,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(userId, categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategories value) loadCategories,
    required TResult Function(CreateCategory value) createCategory,
    required TResult Function(UpdateCategory value) updateCategory,
    required TResult Function(DeleteCategory value) deleteCategory,
  }) {
    return deleteCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategories value)? loadCategories,
    TResult? Function(CreateCategory value)? createCategory,
    TResult? Function(UpdateCategory value)? updateCategory,
    TResult? Function(DeleteCategory value)? deleteCategory,
  }) {
    return deleteCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategories value)? loadCategories,
    TResult Function(CreateCategory value)? createCategory,
    TResult Function(UpdateCategory value)? updateCategory,
    TResult Function(DeleteCategory value)? deleteCategory,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(this);
    }
    return orElse();
  }
}

abstract class DeleteCategory implements CategoryEvent {
  const factory DeleteCategory({
    required final String userId,
    required final String categoryId,
  }) = _$DeleteCategoryImpl;

  @override
  String get userId;
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteCategoryImplCopyWith<_$DeleteCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
