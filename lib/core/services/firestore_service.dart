import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addDatatoDatabase({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkDocumentExists({
    required String path,
    required String documentId,
  }) {
    // TODO: implement checkDocumentExists
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDataFromDatabase({
    required String path,
    required String documentId,
  }) {
    // TODO: implement deleteDataFromDatabase
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> getDataFromDatabase({
    required String path,
    required String documentId,
  }) {
    // TODO: implement getDataFromDatabase
    throw UnimplementedError();
  }

  @override
  Future<void> updateDataInDatabase({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) {
    // TODO: implement updateDataInDatabase
    throw UnimplementedError();
  }
}
