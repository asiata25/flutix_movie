<p align="center">
<img src="./assets/images/logo.png" alt="Flutix Logo" width="100"> 
</p>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Flutter-3.24.5-blue?style=flat-square&logo=flutter" alt="Flutter Badge">
  </a>
  <a href="https://supabase.com">
    <img src="https://img.shields.io/badge/Supabase-v2.8.1-green?style=flat-square&logo=supabase" alt="Supabase Badge">
  </a>
  <a href="https://bloclibrary.dev">
    <img src="https://img.shields.io/badge/BLoC-8.1.6-lightblue?style=flat-square&logo=dart" alt="BLoC Badge">
  </a>
  <a href="https://pub.dev/packages/get_it">
    <img src="https://img.shields.io/badge/Get%20It-8.0.2-yellow?style=flat-square&logo=dart" alt="Get It Badge">
  </a>
  <a href="https://pub.dev/packages/equatable">
    <img src="https://img.shields.io/badge/Equatable-2.0.7-orange?style=flat-square&logo=dart" alt="Equatable Badge">
  </a>
</p>

# Flutix Movie

Flutix Movie is a modern mobile application for booking movie tickets effortlessly. Built using **Flutter**, it provides an intuitive interface and smooth user experience. With secure authentication, real-time data, and a clean architecture, Flutix ensures an enjoyable ticket booking process.

## 🚀 Features

- 🔐 User Authentication (powered by **Supabase**)
- 🎯 State Management with **BLoC**
- 💉 Dependency Injection using **Get It**
- ⚖️ Immutable Data Models with **Equatable**
  <!-- - 🎟️ Browse and Book Movie Tickets   -->
  <!-- - 💾 Saved Bookings and History   -->

## 📦 Installation

### Prerequisites

- Flutter SDK installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- Supabase account ([Supabase](https://supabase.com))

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/asiata25/flutix_movie.git
   cd flutix-movie
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Supabase credentials in `lib/core/constant/constant.dart`:
   ```dart
    const supabseUrl = "https://xxxxx.supabase.co";
    const supabseAnonKey = "...";
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 🔀 App Workflow

### Login
![Login](./docs/Login%20Workflow.png "Login")
