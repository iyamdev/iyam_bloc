import 'package:bloc/bloc.dart';
import 'package:eitherx/eitherx.dart';
import '../event/load_event.dart';
import '../state/base_state.dart';
import '../state/load_state.dart';

abstract class BaseLoadBloc<T> extends Bloc<LoadEvent, BaseState> {
  BaseLoadBloc() : super(InitialState()) {
    on<LoadRequested>(_onLoad);
    on<RefreshRequested>(_onRefresh);
  }

  Future<Either<String, T>> fetch();

  Future<void> _onLoad(LoadRequested event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    final result = await fetch();
    result.fold(
      (error) => emit(ErrorState(error)),
      (data) => emit(SuccessState<T>(data)),
    );
  }

  Future<void> _onRefresh(
    RefreshRequested event,
    Emitter<BaseState> emit,
  ) async {
    final result = await fetch();
    result.fold((error) {}, (data) => emit(SuccessState<T>(data)));
  }
}
