import 'base_state.dart';

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T> extends BaseState {
  final T data;
  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends BaseState {
  final String message;
  const ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
