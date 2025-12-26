import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/state/base_state.dart';
import '../base/state/load_state.dart';

class BlocConsumerPage<B extends StateStreamable<BaseState>, T>
    extends StatelessWidget {
  final Widget Function() loading;
  final Widget Function(T data) success;
  final Widget Function(String message) error;

  /// dipanggil saat SuccessState
  final void Function(BuildContext context, T data)? onSuccess;

  /// dipanggil saat ErrorState
  final void Function(BuildContext context, String message)? onError;

  const BlocConsumerPage({
    super.key,
    required this.loading,
    required this.success,
    required this.error,
    this.onSuccess,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, BaseState>(
      listener: (context, state) {
        if (state is SuccessState<T>) {
          onSuccess?.call(context, state.data);
        }
        if (state is ErrorState) {
          onError?.call(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return loading();
        }

        if (state is SuccessState<T>) {
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
