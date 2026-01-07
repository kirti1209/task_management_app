import 'package:equatable/equatable.dart';

abstract class YesterdayPendingEvent extends Equatable {
  const YesterdayPendingEvent();
  @override
  List<Object?> get props => [];
}

class LoadYesterdayPendingTasks extends YesterdayPendingEvent {
  const LoadYesterdayPendingTasks();
}

class RefreshYesterdayPendingTasks extends YesterdayPendingEvent {
  const RefreshYesterdayPendingTasks();
}

