import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/bloc/base_pagination_bloc.dart';
import '../base/event/pagination_event.dart';
import '../base/state/pagination_state.dart';

class BlocPaginationView<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Widget loadingIndicator;
  final EdgeInsets padding;

  const BlocPaginationView({
    super.key,
    required this.itemBuilder,
    this.loadingIndicator = const Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: CircularProgressIndicator()),
    ),
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePaginationBloc<T>, PaginationState<T>>(
      builder: (context, state) {
        return ListView.builder(
          padding: padding,
          itemCount: state.items.length + (state.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < state.items.length) {
              return itemBuilder(context, state.items[index]);
            }

            if (state.hasMore) {
              context.read<BasePaginationBloc<T>>().add(LoadNextPage());
              return loadingIndicator;
            }

            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
