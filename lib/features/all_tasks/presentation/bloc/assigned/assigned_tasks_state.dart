import 'package:equatable/equatable.dart';
import '../../../domain/entities/task_item.dart';

abstract class AssignedTasksState extends Equatable {
  const AssignedTasksState();
  @override
  List<Object?> get props => [];
}

class AssignedInitial extends AssignedTasksState {
  const AssignedInitial();
}

class AssignedLoading extends AssignedTasksState {
  const AssignedLoading();
}

class AssignedLoaded extends AssignedTasksState {
  final List<TaskItem> tasks;
  const AssignedLoaded(this.tasks);
  @override
  List<Object?> get props => [tasks];
}

class AssignedEmpty extends AssignedTasksState {
  const AssignedEmpty();
}

class AssignedError extends AssignedTasksState {
  final String message;
  const AssignedError(this.message);
  @override
  List<Object?> get props => [message];
}

