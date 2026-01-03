# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [0.3.1] - 2026-01-03

### Added

- Added `builder` parameter to `BlocBuilderPage`, `BlocConsumerPage`, and `BlocScaffoldPage` for custom state handling.
- Made `loading`, `success`, and `error` widgets optional when `builder` is used.

## [0.2.0] - 2026-01-03

### Changed

- **BREAKING**: Removed `iyam_core` dependency and replaced with `eitherx`.
- **BREAKING**: Refactored `BaseLoadBloc`, `BasePaginationBloc`, and `BaseFormBloc` to return `Either<String, T>` instead of `RepositoryResult`.
- Added `PaginationResult` model locally as it was removed with `iyam_core`.
- Upgrade `bloc` to ^9.2.0.
