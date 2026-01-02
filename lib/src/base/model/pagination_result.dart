class PaginationResult<T> {
  final List<T> items;
  final bool hasMore;

  const PaginationResult({
    required this.items,
    required this.hasMore,
  });
}
