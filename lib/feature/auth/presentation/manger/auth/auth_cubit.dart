import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  //add your authentication methods here
}
