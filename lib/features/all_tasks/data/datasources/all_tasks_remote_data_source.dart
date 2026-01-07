import '../../domain/entities/task_item.dart';

abstract class AllTasksRemoteDataSource {
  Future<List<TaskItem>> fetchAssignedTasks();
  Future<List<TaskItem>> fetchUpcomingTasks();
}

class AllTasksRemoteDataSourceMock implements AllTasksRemoteDataSource {
  @override
  Future<List<TaskItem>> fetchAssignedTasks() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      TaskItem(
        id: 'a1',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 5:00 PM',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'a2',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 5:30 PM',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'a3',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 6:00 PM',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'a4',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 5:00 PM',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'a5',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 6:00 PM',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'a6',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 6:00 PM',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'a7',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Due by 6:00 PM',
        location: 'Pune, Maharashtra',
      ),
    ];
  }

  @override
  Future<List<TaskItem>> fetchUpcomingTasks() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      TaskItem(
        id: 'u1',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Issued at 22 Oct',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'u2',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Issued at 23 Oct',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'u3',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Issued at 24 Oct',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'u4',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Issued at 25 Oct',
        location: 'Pune, Maharashtra',
      ),
      TaskItem(
        id: 'u5',
        title: 'Shri Swami Samarth Patsanstha',
        description: 'Monthly documentation and fund verification',
        metaText: 'Issued at 26 Oct',
        location: 'Pune, Maharashtra',
      ),
    ];
  }
}
