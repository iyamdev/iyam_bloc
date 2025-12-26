import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/state/base_state.dart';
import '../base/state/load_state.dart';

class BlocBuilderPage<B extends StateStreamable<BaseState>, T>
    extends StatelessWidget {
  final Widget Function() loading;
  final Widget Function(T data) success;
  final Widget Function(String message) error;
  final Widget Function()? empty;

  const BlocBuilderPage({
    super.key,
    required this.loading,
    required this.success,
    required this.error,
    this.empty,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BaseState>(
      builder: (_, state) {
        if (state is LoadingState) {
          return loading();
        }

        if (state is SuccessState<T>) {
          if (empty != null &&
              state.data is Iterable &&
              (state.data as Iterable).isEmpty) {
            return empty!();
          }
          return success(state.data);
        }

        if (state is ErrorState) {
          return error(state.message);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
