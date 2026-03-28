# Rick and Morty PIT Test

A Flutter application that explores the Rick and Morty universe, built with **Clean Architecture**, **Riverpod**, and **Hive**.

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>= 3.38.1)
- [Dart SDK](https://dart.dev/get-started/dart-sdk) (>= 3.10.0)

### Setup Instructions

1.  **Clone the Repository**

    ```bash
    git clone <repository-url>
    cd rick_montry_pit_test
    ```

2.  **Install Dependencies**

    ```bash
    flutter pub get
    ```

3.  **Generate Base Code**
    This project uses `build_runner` for code generation (Freezed, JsonSerializable, Retrofit). Run the following command to generate the necessary files:

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Configure Environment**
    Ensure a `.env` file exists in the root directory with the base API URL:

    ```env
    BASE_URL=https://rickandmortyapi.com/api/
    ```

5.  **Run the App**
    ```bash
    flutter run
    ```

---

## 🏗 Architecture & Technologies

### 💡 State Management: Riverpod

**Choice: Riverpod (v3)**

Riverpod was selected for several key reasons:

- **Compile-time Safety**: It eliminates many runtime errors that can occur with Provider (e.g., `ProviderNotFoundException`).
- **No BuildContext**: State can be accessed without a context, making it easier to manage business logic outside the UI layer.
- **Dependency Overrides**: Exceptionally useful for testing and providing mocks during development.
- **Reactivity**: It handles asynchronous data (FutureProvider, StreamProvider) and complex state updates efficiently.

### 💾 Storage: Hive

**Choice: Hive**

Hive is used for local data persistence and as a caching layer:

- **Performance**: Being a NoSQL database that works directly with memory-mapped files, it's significantly faster than SQLite for most read/write operations.
- **Simplicity**: No complex SQL schemas; data is stored as boxes.
- **Offline-First Support**: It stores character data, favorite lists, and user overrides, enabling basic offline functionality.

### 🌐 Network Layer: Dio + Retrofit

The application uses **Dio** for network requests combined with **Retrofit** for type-safe API client generation.

Key design choices:

- **Custom Interceptors**: A `CustomInterceptors` class is used to log requests/responses and to **wrap** the raw API response into a consistent format (`results`, `status_code`, `message`). This ensures the app can consume data in a unified way regardless of the original API structure.
- **Base Response Pattern**: All data layer operations return a `BaseResponse<T>`, which encapsulates the data or error details, making the domain layer predictable.

---

## 🔒 Offline-First Strategy

The application implements a robust offline-first approach for character data:

1.  **Remote Fetch**: Always tries to fetch fresh data from the API first.
2.  **Caching**: API responses are automatically cached in Hive.
3.  **Fallback**: If the network is unavailable, the app falls back to the local Hive cache (specifically for the first page) to ensure the user can still browse previously loaded data.

---

## ⚠️ Known Limitations

- **Partial Offline Pagination**: Currently, only the first page of characters is cached for offline use. Navigating to subsequent pages while offline may result in an error.
- **Filter Limitations**: Filtering characters (by status, name, or species) is an online-only operation as it relies on API-side filtering.
- **Cache Policy**: The current cache does not have an expiration time, meaning it may show stale data if the user doesn't have an active connection to refresh it.
