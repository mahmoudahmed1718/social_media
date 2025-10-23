import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/core/errors/custom_excption.dart';
import 'package:social_media/feature/auth/data/models/app_user_model.dart';
import 'package:social_media/feature/auth/domain/entites/app_user.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      log(
        'execption on firebaseAuthServerce.createUserWithEmailAndPassword. ${e.toString()}and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'Please check your internet connection.',
        );
      } else {
        throw CustomException(message: 'An unknown error occurred.');
      }
    } catch (e) {
      log(
        'execption on firebaseAuthServerce.createUserWithEmailAndPassword. ${e.toString()}',
      );
      throw CustomException(message: 'An unknown error occurred.');
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      log(
        'execption on firebaseAuthServerce.signInWithEmailAndPassword. ${e.toString()}and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'Wrong password provided for that user.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: 'Please check your internet connection.',
        );
      } else {
        throw CustomException(message: 'An unknown error occurred.');
      }
    } catch (e) {
      log(
        'execption on firebaseAuthServerce.signInWithEmailAndPassword. ${e.toString()}',
      );
      throw CustomException(message: 'An unknown error occurred.');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<AppUserEntity> saveUserData({
    required AppUserEntity userEntity,
  }) async {
    var jsonData = jsonEncode(AppUserModel.fromEntity(userEntity).toJosn());
    await SharedPreferenceSingleton.setString(kUserData, jsonData);
    return userEntity;
  }
}
