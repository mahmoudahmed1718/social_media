import 'package:social_media/core/services/backend_point.dart';
import 'package:social_media/feature/profile/domain/entities/profile_user_entity.dart';

class ProfileUserModel extends ProfileUserEntity {
  ProfileUserModel({
    super.username,
    super.bio,
    super.profilePictureUrl,
    required super.uId,
    required super.name,
    required super.email,
  });
  // convert appuser to json
  Map<String, dynamic> toJson() {
    return {
      BackendPoint.uId: uId,
      BackendPoint.name: name,
      BackendPoint.email: email,
      BackendPoint.username: username,
      BackendPoint.bio: bio,
      BackendPoint.profilePictureUrl: profilePictureUrl,
    };
  }

  // convert json to appuser
  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      uId: json[BackendPoint.uId],
      name: json[BackendPoint.name],
      email: json[BackendPoint.email],
      username: json[BackendPoint.username] ?? '',
      bio: json[BackendPoint.bio] ?? '',
      profilePictureUrl: json[BackendPoint.profilePictureUrl] ?? '',
    );
  }
}
