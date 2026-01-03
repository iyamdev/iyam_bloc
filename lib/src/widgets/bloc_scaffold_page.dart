import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/state/base_state.dart';
import '../base/state/load_state.dart';

class BlocScaffoldPage<B extends StateStreamable<BaseState>, T>
    extends StatelessWidget {
  final String title;
  final Widget Function(T data)? body;
  final Widget Function()? loading;
  final Widget Function(String message)? error;
  final Widget Function(BuildContext context, BaseState state)? builder;
  final List<Widget>? actions;

  const BlocScaffoldPage({
    super.key,
    required this.title,
    this.body,
    this.loading,
    this.error,
    this.builder,
    this.actions,
  }) : assert(
          builder != null || body != null,
          'Either builder or body must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: BlocBuilder<B, BaseState>(
        builder: (context, state) {
          if (builder != null) {
            return builder!(context, state);
          }

          if (state is LoadingState) {
            return loading?.call() ??
                const Center(child: CircularProgressIndicator());
          }

          if (state is SuccessState<T>) {
            return body!(state.data);
          }

          if (state is ErrorState) {
            return error?.call(state.message) ??
                Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
