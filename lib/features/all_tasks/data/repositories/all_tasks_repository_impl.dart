import '../../domain/entities/task_item.dart';
import '../../domain/repositories/all_tasks_repository.dart';
import '../datasources/all_tasks_remote_data_source.dart';

class AllTasksRepositoryImpl implements AllTasksRepository {
  final AllTasksRemoteDataSource remote;

  AllTasksRepositoryImpl({required this.remote});

  @override
  Future<List<TaskItem>> getAssignedTasks() async {
    return await remote.fetchAssignedTasks();
  }

  @override
  Future<List<TaskItem>> getUpcomingTasks() async {
    return await remote.fetchUpcomingTasks();
  }
}
