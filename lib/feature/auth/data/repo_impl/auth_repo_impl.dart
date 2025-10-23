// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:social_media/constant.dart';
// import 'package:social_media/core/errors/custom_excption.dart';
// import 'package:social_media/core/errors/server_faileur.dart';
// import 'package:social_media/core/services/firebase_auth_service.dart';
// import 'package:social_media/core/services/shared_prefence_singleton.dart';
// import 'package:social_media/feature/auth/data/models/app_user_model.dart';
// import 'package:social_media/feature/auth/domain/entites/app_user.dart';
// import 'package:social_media/feature/auth/domain/repo/auth_repo.dart';

// class AuthRepoImpl implements AuthRepo {
//   final FirebaseAuthService firebaseAuthService;
//   AuthRepoImpl({required this.firebaseAuthService});
//   @override
//   Future<Either<ServerFaileur, AppUserEntity>> login({
//     required String email,
//     required String password,
//   }) {
//     try {
//       final user = firebaseAuthService.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on CustomException catch (e) {
//      return left(ServerFaileur(message: e.message));
//     }
//   }

//   @override
//   /*************  ✨ Windsurf Command ⭐  *************/
//   /// Logout user from the system.
//   ///
//   /// This method is not implemented yet.
//   ///
//   /// Throws [UnimplementedError] if called.
//   ///
//   /*******  0944f848-ea40-47d5-8125-47468c698ce8  *******/
//   Future<void> logout() {
//     // TODO: implement logout
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<ServerFaileur, AppUserEntity>> register({
//     required String name,
//     required String email,
//     required String password,
//   }) {
//     // TODO: implement register
//     throw UnimplementedError();
//   }

//   Future<AppUserEntity> saveUserData({
//     required AppUserEntity userEntity,
//   }) async {
//     var jsonData = jsonEncode(AppUserModel.fromEntity(userEntity).toJosn());
//     await SharedPreferenceSingleton.setString(kuserData, jsonData);
//     return userEntity;
//   }
// }
