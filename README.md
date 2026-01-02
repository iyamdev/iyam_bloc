# iyam_bloc

`iyam_bloc` adalah **package template BLoC** untuk Flutter yang menyediakan
**state management boilerplate siap pakai**, generic, dan reusable lintas aplikasi.

Package ini dibangun di atas:

- `bloc` / `flutter_bloc`

Tujuan utama `iyam_bloc`:

- mengurangi boilerplate BLoC
- menyeragamkan pola load, pagination, dan form
- menjaga arsitektur tetap bersih & type-safe

---

## ✨ Features

### 🔄 Load → Success → Error

- `BaseLoadBloc`
- State standar: initial, loading, success, error
- Widget helper: `BlocBuilderPage`, `BlocConsumerPage`

### 📄 Pagination

- `BasePaginationBloc`
- `PaginationState`
- Infinite scroll support
- Footer loading & error handling
- Widget helper: `BlocPaginationView`

### 📝 Form Handling

- `BaseFormBloc`
- State submit, success, error
- Widget helper: `BlocFormBuilder`

### 🧱 Page Templates

- `BlocBuilderPage`
- `BlocConsumerPage`
- `BlocScaffoldPage`

---

## 📦 Installation

### pub.dev

```yaml
dependencies:
  iyam_bloc: ^0.1.0
```
