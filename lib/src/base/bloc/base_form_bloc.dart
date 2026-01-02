import 'package:bloc/bloc.dart';
import 'package:eitherx/eitherx.dart';
import '../event/form_event.dart';
import '../state/form_state.dart';

abstract class BaseFormBloc<T> extends Bloc<FormEvent, FormState<T>> {
  BaseFormBloc(T initial) : super(FormState(value: initial)) {
    on<FormChanged<T>>(_onChange);
    on<FormSubmitted>(_onSubmit);
  }

  Future<Either<String, void>> submit(T value);

  void _onChange(FormChanged<T> event, Emitter<FormState<T>> emit) {
    emit(state.copyWith(value: event.value));
  }

  Future<void> _onSubmit(
    FormSubmitted event,
    Emitter<FormState<T>> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true));

    final result = await submit(state.value);
    result.fold(
      (error) => emit(state.copyWith(isSubmitting: false, error: error)),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }
}
