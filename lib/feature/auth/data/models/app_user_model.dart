import 'package:social_media/core/services/backend_point.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';

class AppUserModel extends AppUserEntity {
  AppUserModel({required super.uId, required super.name, required super.email});

  toJosn() {
    return {
      BackendPoint.uId: uId,
      BackendPoint.name: name,
      BackendPoint.email: email,
    };
  }

  factory AppUserModel.fromJosn(Map<String, dynamic> json) {
    return AppUserModel(
      uId: json[BackendPoint.uId],
      name: json[BackendPoint.name],
      email: json[BackendPoint.email],
    );
  }
  factory AppUserModel.fromEntity(AppUserEntity user) {
    return AppUserModel(uId: user.uId, name: user.name, email: user.email);
  }
}
