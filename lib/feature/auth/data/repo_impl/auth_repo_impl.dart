import 'package:dartz/dartz.dart';
import 'package:social_media/core/errors/custom_excption.dart';
import 'package:social_media/core/errors/server_faileur.dart';
import 'package:social_media/core/services/firebase_auth_service.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';
import 'package:social_media/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<ServerFaileur, AppUserEntity>> login({
    required String email,
    required String password,
  }) {
    try {
      final user = firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on CustomException catch (e) {}
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFaileur, AppUserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
