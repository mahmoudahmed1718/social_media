import 'package:social_media/feature/profile/domain/entities/profile_user_entity.dart';

abstract class ProfileRepo {
  // Get  user profile
  Future<ProfileUserEntity> getUserProfile({required String uId});
  // Update user profile
  Future<void> updateUserProfile({required ProfileUserEntity user});
}
