import '../../domain/entities/pending_task.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl({required this.remote});

  @override
  Future<List<PendingTask>> getYesterdayPendingTasks() async {
    return await remote.fetchYesterdayPendingTasks();
  }
}

