import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/all_tasks_repository.dart';
import 'upcoming_tasks_event.dart';
import 'upcoming_tasks_state.dart';

class UpcomingTasksBloc extends Bloc<UpcomingTasksEvent, UpcomingTasksState> {
  final AllTasksRepository repository;

  UpcomingTasksBloc({required this.repository}) : super(const UpcomingInitial()) {
    on<LoadUpcomingTasks>(_onLoad);
    on<RefreshUpcomingTasks>(_onLoad);
  }

  Future<void> _onLoad(
    UpcomingTasksEvent event,
    Emitter<UpcomingTasksState> emit,
  ) async {
    emit(const UpcomingLoading());
    try {
      final tasks = await repository.getUpcomingTasks();
      if (tasks.isEmpty) {
        emit(const UpcomingEmpty());
      } else {
        emit(UpcomingLoaded(tasks));
      }
    } catch (e) {
      emit(UpcomingError(e.toString()));
    }
  }
}

