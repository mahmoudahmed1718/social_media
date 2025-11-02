import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/feature/profile/domain/entities/profile_user_entity.dart';
import 'package:social_media/feature/profile/domain/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  // Get user profile
  Future<void> getUserProfile({required String uId}) async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.getUserProfile(uId: uId);
      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  // Update user profile
  Future<void> updateUserProfile({required ProfileUserEntity user}) async {
    emit(ProfileLoading());
    try {
      await profileRepo.updateUserProfile(user: user);
      final updatedUser = await profileRepo.getUserProfile(uId: user.uId);
      emit(ProfileLoaded(user: updatedUser));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
