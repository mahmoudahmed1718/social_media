import 'package:social_media/feature/auth/domain/entites/app_user.dart';

class AppUserModel extends AppUserEntity {
  AppUserModel({required super.uId, required super.name, required super.email});

  toJosn() {
    return {'uId': uId, 'name': name, 'email': email};
  }
}
