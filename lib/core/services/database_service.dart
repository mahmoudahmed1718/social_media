abstract class DatabaseService {
  Future<void> addDatatoDatabase({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<Map<String, dynamic>?> getDataFromDatabase({
    required String path,
    required String documentId,
  });
  Future<void> updateDataInDatabase({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });
  Future<void> deleteDataFromDatabase({
    required String path,
    required String documentId,
  });
  Future<bool> checkDocumentExists({
    required String path,
    required String documentId,
  });
}
