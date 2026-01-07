import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import 'yesterday_pending_event.dart';
import 'yesterday_pending_state.dart';

class YesterdayPendingBloc
    extends Bloc<YesterdayPendingEvent, YesterdayPendingState> {
  final HomeRepository repository;

  YesterdayPendingBloc({required this.repository})
      : super(const YesterdayPendingInitial()) {
    on<LoadYesterdayPendingTasks>(_onLoad);
    on<RefreshYesterdayPendingTasks>(_onLoad);
  }

  Future<void> _onLoad(YesterdayPendingEvent event,
      Emitter<YesterdayPendingState> emit) async {
    emit(const YesterdayPendingLoading());
    try {
      final tasks = await repository.getYesterdayPendingTasks();
      if (tasks.isEmpty) {
        emit(const YesterdayPendingEmpty());
      } else {
        emit(YesterdayPendingLoaded(tasks));
      }
    } catch (e) {
      emit(YesterdayPendingError(e.toString()));
    }
  }
}

