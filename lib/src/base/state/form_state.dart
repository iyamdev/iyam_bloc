import 'base_state.dart';

class FormState<T> extends BaseState {
  final T value;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  const FormState({
    required this.value,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  FormState<T> copyWith({
    T? value,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return FormState(
      value: value ?? this.value,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }

  @override
  List<Object?> get props => [value, isSubmitting, isSuccess, error];
}
