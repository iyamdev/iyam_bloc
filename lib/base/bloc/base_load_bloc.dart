import 'package:bloc/bloc.dart';
import 'package:iyam_core/data/repository/repository_result.dart';
import '../event/load_event.dart';
import '../state/base_state.dart';
import '../state/load_state.dart';

abstract class BaseLoadBloc<T> extends Bloc<LoadEvent, BaseState> {
  BaseLoadBloc() : super(InitialState()) {
    on<LoadRequested>(_onLoad);
    on<RefreshRequested>(_onRefresh);
  }

  Future<RepositoryResult<T>> fetch();

  Future<void> _onLoad(LoadRequested event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    final result = await fetch();
    if (result is RepoSuccess<T>) {
      emit(SuccessState<T>(result.data));
    } else if (result is RepoFailure<T>) {
      emit(ErrorState(result.message));
    }
  }

  Future<void> _onRefresh(
    RefreshRequested event,
    Emitter<BaseState> emit,
  ) async {
    final result = await fetch();
    if (result is RepoSuccess<T>) {
      emit(SuccessState<T>(result.data));
    }
  }
}
