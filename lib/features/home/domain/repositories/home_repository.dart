import '../entities/pending_task.dart';

abstract class HomeRepository {
  Future<List<PendingTask>> getYesterdayPendingTasks();
}

