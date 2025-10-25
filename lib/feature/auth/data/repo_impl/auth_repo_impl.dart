import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:social_media/constant.dart';
import 'package:social_media/core/errors/custom_excption.dart';
import 'package:social_media/core/errors/server_faileur.dart';
import 'package:social_media/core/services/firebase_auth_service.dart';
import 'package:social_media/core/services/shared_prefence_singleton.dart';
import 'package:social_media/feature/auth/data/models/app_user_model.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';
import 'package:social_media/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<ServerFaileur, AppUserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        final appUser = AppUserModel.fromFirebaseUser(user);
        await saveUserData(userEntity: appUser);
        return Right(appUser);
      } else {
        return Left(ServerFaileur(message: 'User data is null'));
      }
    } on CustomException catch (e) {
      return Left(ServerFaileur(message: e.message));
    } catch (e) {
      return Left(ServerFaileur(message: 'An unknown error occurred.'));
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuthService.signOut();
  }

  @override
  Future<Either<ServerFaileur, AppUserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return Right(AppUserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFaileur(message: e.message));
    } catch (e) {
      return Left(ServerFaileur(message: 'An unknown error occurred.'));
    }
  }

  Future<AppUserEntity> saveUserData({
    required AppUserEntity userEntity,
  }) async {
    var jsonData = jsonEncode(AppUserModel.fromEntity(userEntity).toJosn());
    await SharedPreferenceSingleton.setString(kuserData, jsonData);
    return userEntity;
  }
}
