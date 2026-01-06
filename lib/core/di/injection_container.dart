import 'package:shared_preferences/shared_preferences.dart';
import '../../features/login/data/datasources/login_local_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  
  // Data Sources
  final loginLocalDataSource = LoginLocalDataSourceImpl(
    sharedPreferences: sharedPreferences,
  );
  
  // Repositories
  final loginRepository = LoginRepositoryImpl(
    localDataSource: loginLocalDataSource,
  );
  
  // Store for dependency injection
  DependencyContainer.instance = DependencyContainer(
    loginRepository: loginRepository,
  );
}

class DependencyContainer {
  static DependencyContainer? instance;
  
  final LoginRepository loginRepository;
  
  DependencyContainer({
    required this.loginRepository,
  });
  
  LoginBloc getLoginBloc() {
    return LoginBloc(loginRepository: loginRepository);
  }
}

