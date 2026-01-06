import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> login(String username, String password) async {
    return await localDataSource.login(username, password);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await localDataSource.isLoggedIn();
  }

  @override
  Future<void> logout() async {
    await localDataSource.logout();
  }
}

