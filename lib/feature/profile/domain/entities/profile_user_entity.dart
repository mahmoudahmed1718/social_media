import 'package:social_media/feature/auth/domain/entites/app_user.dart';

class ProfileUserEntity extends AppUserEntity {
  final String? username;
  final String? bio;
  final String? profilePictureUrl;

  ProfileUserEntity({
    this.username,
    this.bio,
    this.profilePictureUrl,
    required super.uId,
    required super.name,
    required super.email,
  });

  ProfileUserEntity copyWith({
    String? username,
    String? bio,
    String? profilePictureUrl,
    String? name,
    String? email,
  }) {
    return ProfileUserEntity(
      username: username ?? this.username,
      bio: bio ?? this.bio,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      uId: uId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
