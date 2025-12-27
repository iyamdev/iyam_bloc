import 'package:flutter/widgets.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/state/form_state.dart';

class BlocFormBuilder<B extends StateStreamable<FormState<T>>, T>
    extends StatelessWidget {
  final Widget Function(BuildContext context, FormState<T> state) builder;

  final void Function(BuildContext context, FormState<T> state)? listener;

  const BlocFormBuilder({super.key, required this.builder, this.listener});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, FormState<T>>(
      listener: (context, state) {
        if (listener != null) {
          listener!(context, state);
        }
      },
      builder: (context, state) {
        return builder(context, state);
      },
    );
  }
}
