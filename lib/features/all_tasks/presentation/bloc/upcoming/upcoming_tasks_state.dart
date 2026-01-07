import 'package:equatable/equatable.dart';
import '../../../domain/entities/task_item.dart';

abstract class UpcomingTasksState extends Equatable {
  const UpcomingTasksState();
  @override
  List<Object?> get props => [];
}

class UpcomingInitial extends UpcomingTasksState {
  const UpcomingInitial();
}

class UpcomingLoading extends UpcomingTasksState {
  const UpcomingLoading();
}

class UpcomingLoaded extends UpcomingTasksState {
  final List<TaskItem> tasks;
  const UpcomingLoaded(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

class UpcomingEmpty extends UpcomingTasksState {
  const UpcomingEmpty();
}

class UpcomingError extends UpcomingTasksState {
  final String message;
  const UpcomingError(this.message);
  @override
  List<Object?> get props => [message];
}

