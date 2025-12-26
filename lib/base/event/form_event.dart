abstract class FormEvent {}

class FormChanged<T> extends FormEvent {
  final T value;
  FormChanged(this.value);
}

class FormSubmitted extends FormEvent {}
