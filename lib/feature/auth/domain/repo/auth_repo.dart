abstract class AuthRepo {
  Future<void> signIn(String email, String password);
}
