abstract class LoginRepository {
  Future<bool> login(String username, String password);
  Future<bool> isLoggedIn();
  Future<void> logout();
}

