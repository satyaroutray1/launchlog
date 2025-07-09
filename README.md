# 🚀 SpaceX V4 - Flutter App

A Flutter application that consumes the [SpaceX V4 API](https://github.com/r-spacex/SpaceX-API) to display information about SpaceX **Launches** and **Rockets**. This project demonstrates clean architecture principles using `BLoC`, dependency injection with `get_it`, local storage with `Hive`, and custom UI navigation using `persistent_bottom_nav_bar`.


## 🧠 Architecture - Clean & Scalable

This app follows the **Clean Architecture** pattern:


## 🧱 Core Technologies

| Feature            | Tool/Library                       | Purpose                                                  |
|--------------------|------------------------------------|----------------------------------------------------------|
| State Management   | `flutter_bloc`, `bloc`             | BLoC pattern for unidirectional, reactive state flow     |
| Local Storage      | `Hive`                             | Fast, lightweight key-value database                     |
| HTTP Client        | `http`                             | REST API data fetching                                   |
| Dependency Injection | `get_it`                         | Manage dependencies cleanly and globally                 |
| Date Formatting    | `intl`                             | Formatting UTC timestamps                                |
| Navigation         | `persistent_bottom_nav_bar_v2`     | Persistent bottom navigation across multiple screens     |
| Testing            | `flutter_test`, `bloc_test`, `mocktail` | Unit testing, BLoC testing, mocking                    |


## 🧪 Testing

This project focuses heavily on **testability**.

- ✅ **Unit Tests** – Validate logic in isolation
- ✅ **BLoC Tests** – Verify state transitions
- ✅ **Mocking** – Achieved via `mocktail` for flexible mock behavior


## ✨ Features

- 🔥 View list of upcoming, past, and latest launches
- 🚀 Explore detailed information about SpaceX rockets
- ⏳ Format and display UTC dates using `intl`
- 💾 Local storage support with Hive (e.g., saving last visited launch or bookmarks)
- ⚙️ BLoC-based state management
- 📱 Clean UI with bottom navigation


## 📸 Screenshots



🛠️ TODO

Add bookmark/save feature using Hive
Add rocket filtering and search
Dark mode UI
Offline support
Unit + Widget + Integration test coverage improvements