import 'package:equatable/equatable.dart';
import '../../domain/entities/pending_task.dart';

abstract class YesterdayPendingState extends Equatable {
  const YesterdayPendingState();
  @override
  List<Object?> get props => [];
}

class YesterdayPendingInitial extends YesterdayPendingState {
  const YesterdayPendingInitial();
}

class YesterdayPendingLoading extends YesterdayPendingState {
  const YesterdayPendingLoading();
}

class YesterdayPendingLoaded extends YesterdayPendingState {
  final List<PendingTask> tasks;
  const YesterdayPendingLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class YesterdayPendingEmpty extends YesterdayPendingState {
  const YesterdayPendingEmpty();
}

class YesterdayPendingError extends YesterdayPendingState {
  final String message;
  const YesterdayPendingError(this.message);

  @override
  List<Object?> get props => [message];
}

