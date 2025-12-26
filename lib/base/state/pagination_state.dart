import 'package:equatable/equatable.dart';

class PaginationState<T> extends Equatable {
  final List<T> items;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const PaginationState({
    required this.items,
    required this.isLoading,
    required this.hasMore,
    this.error,
  });

  /// Initial state
  factory PaginationState.initial() {
    return const PaginationState(
      items: [],
      isLoading: false,
      hasMore: true,
      error: null,
    );
  }

  PaginationState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return PaginationState<T>(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }

  bool get isEmpty => items.isEmpty && !isLoading;

  bool get hasError => error != null && error!.isNotEmpty;

  @override
  List<Object?> get props => [items, isLoading, hasMore, error];
}
