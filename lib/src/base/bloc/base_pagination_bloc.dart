import 'package:bloc/bloc.dart';
import 'package:eitherx/eitherx.dart';

import '../model/pagination_result.dart';
import '../event/pagination_event.dart';
import '../state/pagination_state.dart';

abstract class BasePaginationBloc<T>
    extends Bloc<PaginationEvent, PaginationState<T>> {
  int _page = 1;

  BasePaginationBloc() : super(PaginationState.initial()) {
    on<LoadFirstPage>(_onFirstPage);
    on<LoadNextPage>(_onNextPage);
    on<RefreshPage>(_onRefresh);
  }

  /// Implement di bloc konkret
  Future<Either<String, PaginationResult<T>>> fetchPage(int page);

  Future<void> _onFirstPage(
    LoadFirstPage event,
    Emitter<PaginationState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    _page = 1;

    final result = await fetchPage(_page);
    result.fold(
      (error) => emit(state.copyWith(isLoading: false)),
      (data) => emit(
        PaginationState(
          items: data.items,
          isLoading: false,
          hasMore: data.hasMore,
        ),
      ),
    );
  }

  Future<void> _onNextPage(
    LoadNextPage event,
    Emitter<PaginationState<T>> emit,
  ) async {
    if (!state.hasMore || state.isLoading) return;

    emit(state.copyWith(isLoading: true));
    _page++;

    final result = await fetchPage(_page);
    result.fold(
      (error) => emit(state.copyWith(isLoading: false)),
      (data) => emit(
        PaginationState(
          items: [...state.items, ...data.items],
          isLoading: false,
          hasMore: data.hasMore,
        ),
      ),
    );
  }

  Future<void> _onRefresh(
    RefreshPage event,
    Emitter<PaginationState<T>> emit,
  ) async {
    _page = 1;
    add(LoadFirstPage());
  }
}
