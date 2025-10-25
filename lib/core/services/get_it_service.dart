import 'package:get_it/get_it.dart';
import 'package:social_media/core/services/database_service.dart';
import 'package:social_media/core/services/firebase_auth_service.dart';
import 'package:social_media/core/services/firestore_service.dart';

GetIt getIt = GetIt.instance;
void setupGetItService() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
}
