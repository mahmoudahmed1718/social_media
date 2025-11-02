import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/feature/profile/domain/entities/profile_user_entity.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
}
