import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/app_constants.dart';

abstract class LoginLocalDataSource {
  Future<bool> login(String username, String password);
  Future<bool> isLoggedIn();
  Future<void> logout();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> login(String username, String password) async {
    // Hardcoded credentials check
    if (username == AppConstants.hardcodedUsername &&
        password == AppConstants.hardcodedPassword) {
      await sharedPreferences.setBool('is_logged_in', true);
      await sharedPreferences.setString('username', username);
      return true;
    }
    return false;
  }

  @override
  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool('is_logged_in') ?? false;
  }

  @override
  Future<void> logout() async {
    await sharedPreferences.remove('is_logged_in');
    await sharedPreferences.remove('username');
  }
}

