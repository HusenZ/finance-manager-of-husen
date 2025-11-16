import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
@HiveType(typeId: 1)
class Category with _$Category {
  const factory Category({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String name,
    @HiveField(3) required String icon,
    @HiveField(4) required String color,
    @HiveField(5) @Default(false) bool isCustom,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) DateTime? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromFirestore(Map<String, dynamic> data, String id) {
    return Category(
      id: id,
      userId: data['userId'] as String? ?? '',
      name: data['name'] as String? ?? '',
      icon: data['icon'] as String? ?? '',
      color: data['color'] as String? ?? '',
      isCustom: data['isCustom'] as bool? ?? false,
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'] as String)
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
    );
  }
}

extension CategoryX on Category {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'name': name,
      'icon': icon,
      'color': color,
      'isCustom': isCustom,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
