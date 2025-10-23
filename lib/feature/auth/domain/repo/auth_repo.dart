import 'package:dartz/dartz.dart';
import 'package:social_media/core/errors/server_faileur.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';

abstract class AuthRepo {
  Future<Either<ServerFaileur, AppUser>> login({
    required String email,
    required String password,
  });
  Future<Either<ServerFaileur, AppUser>> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> logout();
}
