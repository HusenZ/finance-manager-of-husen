import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
@HiveType(typeId: 3)
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String name,
    @HiveField(3) String? profilePicture,
    @HiveField(4) @Default('INR') String currency,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.fromFirestore(Map<String, dynamic> data, String id) {
    return UserProfile(
      id: id,
      email: data['email'] as String? ?? '',
      name: data['name'] as String? ?? '',
      profilePicture: data['profilePicture'] as String?,
      currency: data['currency'] as String? ?? 'INR',
      createdAt: data['createdAt'] != null
          ? DateTime.parse(data['createdAt'] as String)
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
    );
  }
}

extension UserProfileX on UserProfile {
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'name': name,
      'profilePicture': profilePicture,
      'currency': currency,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
