import 'package:social_media/core/errors/server_faileur.dart';
import 'package:social_media/core/services/backend_point.dart';
import 'package:social_media/core/services/database_service.dart';
import 'package:social_media/feature/profile/data/models/profile_user_model.dart';
import 'package:social_media/feature/profile/domain/entities/profile_user_entity.dart';
import 'package:social_media/feature/profile/domain/repo/profile_repo.dart';

class ProfileUserRepoImpl implements ProfileRepo {
  final DatabaseService databaseService;

  ProfileUserRepoImpl({required this.databaseService});
  @override
  Future<ProfileUserEntity?> getUserProfile({required String uId}) async {
    try {
      final userData = await databaseService.getDataFromDatabase(
        path: BackendPoint.users,
        documentId: uId,
      );
      if (userData != null) {
        return ProfileUserModel.fromJson(userData);
      }
      return null;
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> updateUserProfile({required ProfileUserEntity user}) async {
    try {
      final userData = await databaseService.updateDataInDatabase(
        path: BackendPoint.users,
        documentId: BackendPoint.uId,
        data: ProfileUserModel.fromEntity(user).toJson(),
      );
      return userData;
    } on ServerFaileur catch (e) {
      throw ServerFaileur(message: e.message);
    }
  }
}
