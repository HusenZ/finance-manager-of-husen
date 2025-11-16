import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.freezed.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadCategories({
    required String userId,
  }) = LoadCategories;

  const factory CategoryEvent.createCategory({
    required String userId,
    required String name,
    required String icon,
    required String color,
  }) = CreateCategory;

  const factory CategoryEvent.updateCategory({
    required String id,
    required String userId,
    required String name,
    required String icon,
    required String color,
    required bool isCustom,
    required DateTime createdAt,
  }) = UpdateCategory;

  const factory CategoryEvent.deleteCategory({
    required String userId,
    required String categoryId,
  }) = DeleteCategory;
}
