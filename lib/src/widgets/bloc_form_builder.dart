import 'package:flutter/widgets.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/state/form_state.dart';

class BlocFormBuilder<B extends StateStreamable<FormState<T>>, T>
    extends StatelessWidget {
  final Widget Function(BuildContext context, FormState<T> state) builder;

  const BlocFormBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, FormState<T>>(
      builder: (context, state) {
        return builder(context, state);
      },
    );
  }
}
