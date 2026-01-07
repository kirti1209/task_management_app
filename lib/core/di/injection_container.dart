import 'package:shared_preferences/shared_preferences.dart';
import '../../features/login/data/datasources/login_local_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/presentation/bloc/yesterday_pending_bloc.dart';
import '../../features/all_tasks/data/datasources/all_tasks_remote_data_source.dart';
import '../../features/all_tasks/data/repositories/all_tasks_repository_impl.dart';
import '../../features/all_tasks/domain/repositories/all_tasks_repository.dart';
import '../../features/all_tasks/presentation/bloc/assigned/assigned_tasks_bloc.dart';
import '../../features/all_tasks/presentation/bloc/upcoming/upcoming_tasks_bloc.dart';

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  
  // Data Sources
  final loginLocalDataSource = LoginLocalDataSourceImpl(
    sharedPreferences: sharedPreferences,
  );
  final homeRemoteDataSource = HomeRemoteDataSourceMock();
  final allTasksRemoteDataSource = AllTasksRemoteDataSourceMock();
  
  // Repositories
  final loginRepository = LoginRepositoryImpl(
    localDataSource: loginLocalDataSource,
  );
  final homeRepository = HomeRepositoryImpl(remote: homeRemoteDataSource);
  final allTasksRepository = AllTasksRepositoryImpl(remote: allTasksRemoteDataSource);
  
  // Store for dependency injection
  DependencyContainer.instance = DependencyContainer(
    loginRepository: loginRepository,
    homeRepository: homeRepository,
    allTasksRepository: allTasksRepository,
  );
}

class DependencyContainer {
  static DependencyContainer? instance;
  
  final LoginRepository loginRepository;
  final HomeRepository homeRepository;
  final AllTasksRepository allTasksRepository;
  
  DependencyContainer({
    required this.loginRepository,
    required this.homeRepository,
    required this.allTasksRepository,
  });
  
  LoginBloc getLoginBloc() {
    return LoginBloc(loginRepository: loginRepository);
  }

  YesterdayPendingBloc getYesterdayPendingBloc() {
    return YesterdayPendingBloc(repository: homeRepository);
  }

  AssignedTasksBloc getAssignedTasksBloc() {
    return AssignedTasksBloc(repository: allTasksRepository);
  }

  UpcomingTasksBloc getUpcomingTasksBloc() {
    return UpcomingTasksBloc(repository: allTasksRepository);
  }
}
