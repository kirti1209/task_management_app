import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/all_tasks_repository.dart';
import 'assigned_tasks_event.dart';
import 'assigned_tasks_state.dart';

class AssignedTasksBloc extends Bloc<AssignedTasksEvent, AssignedTasksState> {
  final AllTasksRepository repository;

  AssignedTasksBloc({required this.repository}) : super(const AssignedInitial()) {
    on<LoadAssignedTasks>(_onLoad);
    on<RefreshAssignedTasks>(_onLoad);
  }

  Future<void> _onLoad(
    AssignedTasksEvent event,
    Emitter<AssignedTasksState> emit,
  ) async {
    emit(const AssignedLoading());
    try {
      final tasks = await repository.getAssignedTasks();
      if (tasks.isEmpty) {
        emit(const AssignedEmpty());
      } else {
        emit(AssignedLoaded(tasks));
      }
    } catch (e) {
      emit(AssignedError(e.toString()));
    }
  }
}

