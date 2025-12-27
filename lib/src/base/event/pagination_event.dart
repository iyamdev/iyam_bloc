abstract class PaginationEvent {}

class LoadFirstPage extends PaginationEvent {}

class LoadNextPage extends PaginationEvent {}

class RefreshPage extends PaginationEvent {}
