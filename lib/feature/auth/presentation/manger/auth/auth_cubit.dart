import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';
import 'package:social_media/feature/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit({required this.repo}) : super(AuthInitial());
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final user = await repo.login(email: email, password: password);
    user.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> rigster({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final user = await repo.register(
      name: name,
      email: email,
      password: password,
    );
    user.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> logout() async {
    await repo.logout();
    emit(AuthInitial());
  }

  Future<AppUserEntity> getCurrentUser() async {
    emit(AuthLoading());

    final user = await repo
        .getCurrentUser(); // repo.getCurrentUser returns Either<Error, AppUserEntity>
    user.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
    return user.fold((l) => throw Exception(l.message), (r) => r);
  }
}
