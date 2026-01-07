import '../../domain/entities/pending_task.dart';

abstract class HomeRemoteDataSource {
  Future<List<PendingTask>> fetchYesterdayPendingTasks();
}

class HomeRemoteDataSourceMock implements HomeRemoteDataSource {
  @override
  Future<List<PendingTask>> fetchYesterdayPendingTasks() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      PendingTask(
        id: '1',
        title: 'Deliver reports to Client A',
        dueDate: '21 Jul',
        assignedBy: 'Manager',
      ),
      PendingTask(
        id: '2',
        title: 'Follow up with the design team',
        dueDate: '21 Jul',
        assignedBy: 'Team Lead',
      ),
      PendingTask(
        id: '3',
        title: 'Prepare monthly verification docs',
        dueDate: '21 Jul',
        assignedBy: 'Supervisor',
      ),
    ];
  }
}

