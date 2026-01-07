import 'package:equatable/equatable.dart';

abstract class UpcomingTasksEvent extends Equatable {
  const UpcomingTasksEvent();
  @override
  List<Object?> get props => [];
}

class LoadUpcomingTasks extends UpcomingTasksEvent {
  const LoadUpcomingTasks();
}

class RefreshUpcomingTasks extends UpcomingTasksEvent {
  const RefreshUpcomingTasks();
}

