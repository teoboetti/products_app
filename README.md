# Products App

Products App is a Flutter mobile application designed to showcase product listings. It utilizes Melos for managing the project's mono-repository structure, GetIt for dependency injection, Bloc for state management, and GoRouter for routing within the application.

## Getting Started

To get started with the Products App, follow these instructions:

1. Clone the repository to your local machine:

```bash
git clone https://github.com/teoboetti/products_app
```

2. Navigate to the project directory:

```bash
cd products_app
```

3. Run Melos to bootstrap the project and set up dependencies:

```bash
melos bootstrap
```

4. Navigate to the `app` directory:

```bash
cd app
```

5. Run the application using the appropriate command based on your development environment:

```bash
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

## Dependencies

Products App relies on the following dependencies:

- **Melos**: Used for managing the mono-repository structure, allowing for easier management of multiple packages within the project.
- **GetIt**: Provides a simple service locator for dependency injection, enabling better decoupling and testability of components.
- **Bloc**: Utilized for state management, helping to separate business logic from UI components and promoting a reactive programming style.
- **GoRouter**: A lightweight and flexible router for Flutter applications, allowing for simple and customizable navigation between screens.
