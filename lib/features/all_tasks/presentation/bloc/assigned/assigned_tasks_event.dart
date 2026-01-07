import 'package:equatable/equatable.dart';

abstract class AssignedTasksEvent extends Equatable {
  const AssignedTasksEvent();
  @override
  List<Object?> get props => [];
}

class LoadAssignedTasks extends AssignedTasksEvent {
  const LoadAssignedTasks();
}

class RefreshAssignedTasks extends AssignedTasksEvent {
  const RefreshAssignedTasks();
}

