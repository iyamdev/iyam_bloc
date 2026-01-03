import 'base_state.dart';

class FormState<T> extends BaseState {
  final T value;
  final bool isSubmitting;
  final bool isSuccess;
  final dynamic data;
  final String? error;

  const FormState({
    required this.value,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.data,
    this.error,
  });

  FormState<T> copyWith({
    T? value,
    bool? isSubmitting,
    bool? isSuccess,
    dynamic data,
    String? error,
  }) {
    return FormState(
      value: value ?? this.value,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      data: data ?? this.data,
      error: error,
    );
  }

  @override
  List<Object?> get props => [value, isSubmitting, isSuccess, data, error];
}
