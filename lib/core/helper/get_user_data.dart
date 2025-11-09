import 'dart:convert';

import 'package:social_media/constant.dart';
import 'package:social_media/core/services/shared_prefence_singleton.dart';
import 'package:social_media/feature/auth/data/models/app_user_model.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';

AppUserEntity getUserData() {
  var jsonString = SharedPreferenceSingleton.getString(kuserData);
  var userentity = AppUserModel.fromJosn(jsonDecode(jsonString));
  return userentity;
}
