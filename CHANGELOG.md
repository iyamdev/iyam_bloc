# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [0.2.0] - 2026-01-03

### Changed

- **BREAKING**: Removed `iyam_core` dependency and replaced with `eitherx`.
- **BREAKING**: Refactored `BaseLoadBloc`, `BasePaginationBloc`, and `BaseFormBloc` to return `Either<String, T>` instead of `RepositoryResult`.
- Added `PaginationResult` model locally as it was removed with `iyam_core`.
- Upgrade `bloc` to ^9.2.0.

## [0.1.4] - 2025-12-27

### Changed

- Upgrade `iyam_core` to ^0.1.3
- Upgrade `flutter_bloc` to ^9.1.1

## [0.1.3] - 2025-12-27

### Changed

- Upgrade `bloc` to ^9.1.0
- Upgrade `equatable` to ^2.0.7

## [0.1.2] - 2025-12-27

### Changed

- Minor bug fixes and improvements.

## [0.1.1] - 2025-12-27

### Changed

- Update dependencies.
- Minor improvements and bug fixes.

## [0.1.0] - 2025-12-27

### Added

- Initial release of `iyam_bloc`
- Base BLoC templates:
  - `BaseLoadBloc`
  - `BasePaginationBloc`
  - `BaseFormBloc`
- State abstractions:
  - Load states (initial, loading, success, error)
  - PaginationState
  - FormState
- Event abstractions:
  - Load events
  - Pagination events
  - Form events
- Widget helpers:
  - `BlocBuilderPage`
  - `BlocConsumerPage`
  - `BlocScaffoldPage`
  - `BlocPaginationView`
  - `BlocFormBuilder`
- Pagination footer loading & error handling
- Full type-safe implementation (no `dynamic`)
