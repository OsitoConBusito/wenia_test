# Wenia Test App

## Overview

The Crypto App is a Flutter application designed to provide users with up-to-date information on various cryptocurrencies. The app displays a list of cryptocurrencies, allowing users to view details such as the name, symbol, and current price of each crypto. The app follows a clean architecture pattern and uses Riverpod for state management, ensuring a scalable, testable, and maintainable codebase.

## Features

- Display a list of cryptocurrencies with name, symbol, and current price.
- Fetch cryptocurrency data from an external API.
- Handle loading states and error handling in the UI.

## Architecture

The application is built using **Clean Architecture** principles. This approach separates the app into distinct layers, ensuring that the core business logic is independent of external factors such as the user interface or data sources. This architecture enhances the maintainability, scalability, and testability of the code.

### Layers

1. **Domain Layer**:
   - **Entities**: Fundamental business objects that represent core concepts within the application. These are pure Dart classes and contain business logic.
   - **Use Cases**: Encapsulate specific business logic or tasks that the app can perform. Each use case represents a single operation (e.g., fetching a list of cryptocurrencies).
   - **Repositories (Interfaces)**: Abstract definitions of data operations. These interfaces are implemented in the data layer, allowing the domain layer to be independent of data sources.

2. **Data Layer**:
   - **Models**: Data structures that mirror the response from external sources (e.g., JSON from an API) and are used to map data to entities.
   - **Repositories (Implementations)**: Concrete implementations of the repository interfaces defined in the domain layer. They interact with the data sources (remote APIs, local databases, etc.) to fetch and persist data.
   - **Data Sources**: Define how data is fetched from different sources (remote APIs, local storage, etc.).

3. **Presentation Layer**:
   - **State Management**: The presentation layer manages the app's state and displays the UI. It interacts with the domain layer via use cases to retrieve and display data.
   - **UI**: Flutter widgets that build the user interface, showing the data and reacting to user inputs.

## State Management

The app uses **Riverpod** for state management. Riverpod is a flexible and powerful state management solution for Flutter. It allows the app to manage state efficiently, making it easy to handle asynchronous operations, global state, and dependency injection.

### Key Concepts

- **Provider**: Supplies dependencies like repositories or use cases to the widgets in the app.
- **FutureProvider**: Used to manage and display asynchronous data, such as fetching cryptocurrency data from an API.

## Libraries and Tools

The app utilizes several key libraries and tools to ensure a smooth development process and feature-rich application:

- **Flutter**: The main framework for building the mobile application.
- **Riverpod**: For state management and dependency injection.
- **http**: For making HTTP requests to the external API to fetch cryptocurrency data.
- **flutter_riverpod**: Provides reactive and scalable state management.
- **cloud_firestore**: For storing and retrieving user-specific data.
- **intl**: For internationalization and formatting dates and numbers.
- **go_router**: For routing and navigation.
- **slang**: For i18n of strings values.

## Folder Structure

```plaintext
lib/
├── data/
│   ├── models/
│   │   └── crypto_model.dart
│   ├── repositories/
│   │   └── crypto_repository_impl.dart
│   └── datasources/
│       ├── remote/
│       │   ├── crypto_remote_data_source.dart
│       │   └── dto/
│       │       └── crypto_request_dto.dart
├── domain/
│   ├── entities/
│   │   └── crypto.dart
│   ├── usecases/
│   │   └── get_cryptos_use_case.dart
│   └── repositories/
│       └── crypto_repository.dart
├── presentation/
│   ├── crypto_list_view.dart
│   └── widgets/
│       └── custom_snackbar.dart
└── main.dart
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/crypto-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd crypto-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

To run the app on your local machine or a connected device, use the following command:

```bash
flutter run
```

### Building for Production

To build the app for production, run:

```bash
flutter build apk
```

Or, for iOS:

```bash
flutter build ios
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have suggestions or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README provides a comprehensive overview of your app, including its architecture, state management, libraries, and setup instructions. You can customize the content further to fit your specific project needs.