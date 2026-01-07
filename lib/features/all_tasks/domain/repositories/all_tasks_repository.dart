import '../entities/task_item.dart';

abstract class AllTasksRepository {
  Future<List<TaskItem>> getAssignedTasks();
  Future<List<TaskItem>> getUpcomingTasks();
}
