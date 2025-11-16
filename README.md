# 💰 Finance Manager

A modern, feature-rich personal finance management application built with Flutter, featuring offline-first architecture, real-time sync, and comprehensive financial tracking capabilities.

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Cloud-FFCA28?logo=firebase)
![License](https://img.shields.io/badge/License-MIT-green)

</div>

## ✨ Features

### 💸 Complete Financial Tracking
- **Income Management** - Track multiple income sources (Salary, Freelance, Business, Investment, etc.)
- **Expense Tracking** - Monitor spending across customizable categories
- **Budget Planning** - Set monthly budgets with smart alerts (80% warning, 100% exceeded)
- **Recurring Transactions** - Automate recurring income and expenses

### 📊 Analytics & Insights
- **Visual Analytics** - Interactive pie charts, line graphs, and trend analysis
- **Period Filtering** - View data by Month, Quarter, Half-year, or Year
- **Net Balance Tracking** - Real-time income vs expenses comparison
- **Category Breakdown** - Detailed spending analysis by category

### 🔄 Smart Sync & Offline Support
- **Offline-First Architecture** - Full functionality without internet
- **Cloud Sync** - Automatic Firebase synchronization
- **Sync Status Indicators** - Visual feedback for unsynced data
- **Data Persistence** - Local storage with Hive

### 🎨 Modern UI/UX
- **Material Design 3** - Beautiful, consistent design language
- **Dark Mode** - Full theme support
- **Responsive Layout** - Optimized for all screen sizes
- **Smooth Animations** - Polished user experience

## 🏗️ Technical Architecture

### Clean Architecture Pattern
```
lib/
├── core/                  # App-wide utilities and constants
│   ├── constants/        # Colors, text styles, app constants
│   ├── router/           # Navigation configuration (GoRouter)
│   └── utils/            # Helpers, validators, formatters
├── data/
│   ├── models/           # Freezed data models
│   ├── services/         # Firebase, Hive, Auth services
│   └── repositories/     # Data layer abstraction
├── presentation/
│   ├── bloc/             # BLoC state management
│   ├── screens/          # UI screens
│   └── widgets/          # Reusable components
└── main.dart
```

### Tech Stack

**Frontend Framework**
- Flutter 3.9.2 with Dart 3.0+
- Material Design 3

**State Management**
- BLoC Pattern (flutter_bloc)
- Freezed for immutable models
- GetIt for dependency injection

**Data & Storage**
- Firebase Firestore (Cloud database)
- Hive (Local offline storage)
- Dartz (Functional programming)

**UI & Visualization**
- FL Chart (Beautiful charts)
- Google Fonts (Custom typography)
- Go Router (Declarative navigation)

**Authentication**
- Firebase Auth
- Google Sign-In

## 🚀 Key Implementation Highlights

### 1. Offline-First Architecture
```dart
Future<Either<String, Income>> createIncome(Income income) async {
  // Save to Hive first (offline-first)
  await _hiveService.saveIncome(income);

  // Try to sync to Firebase
  try {
    await _firebaseService.createIncome(income);
    return Right(syncedIncome);
  } catch (e) {
    // Graceful degradation - return offline version
    return Right(income);
  }
}
```

### 2. Reactive State Management
- BLoC pattern for predictable state management
- Nested BlocBuilders for combining multiple data streams
- Event-driven architecture

### 3. Type-Safe Data Models
```dart
@freezed
class Income with _$Income {
  const factory Income({
    required String id,
    required double amount,
    required String source,
    @Default(false) bool isSynced,
  }) = _Income;
}
```

### 4. Smart Budget Alerts
- 80% spending warning
- 100% exceeded notification
- Visual progress indicators
- Color-coded status (green/orange/red)

## 📱 Screens & Features

| Screen | Features |
|--------|----------|
| **Dashboard** | Balance overview, quick stats, recent transactions, income vs expenses |
| **Transactions** | List/add/edit expenses, search, filter by category, month navigation |
| **Income** | Track income sources, recurring income, monthly summaries, search/filter |
| **Budgets** | Set limits, track progress, spending alerts, category-wise budgets |
| **Analytics** | Charts, trends, period filtering, category breakdown, insights |
| **Settings** | Profile, currency, dark mode, notifications, data export |

## 🛠️ Getting Started

### Prerequisites
```bash
Flutter SDK: >=3.9.2
Dart SDK: >=3.0.0
Firebase project configured
```

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/finance_manager.git
cd finance_manager
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure Firebase**
```bash
# Add your google-services.json (Android)
# Add your GoogleService-Info.plist (iOS)
```

4. **Run build_runner**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

5. **Run the app**
```bash
flutter run
```

## 🎯 Design Patterns & Best Practices

✅ **Clean Architecture** - Separation of concerns (Data, Domain, Presentation)
✅ **SOLID Principles** - Single responsibility, dependency injection
✅ **Repository Pattern** - Abstract data sources
✅ **BLoC Pattern** - Predictable state management
✅ **Functional Programming** - Either monad for error handling
✅ **Code Generation** - Freezed, JSON serialization
✅ **Dependency Injection** - GetIt service locator
✅ **Error Handling** - Graceful degradation, user-friendly messages

## 📊 Performance Optimizations

- Lazy loading with slivers
- Efficient list rendering
- Optimized image caching
- Debounced search
- Minimal rebuilds with BLoC
- Code splitting with lazy routes

## 🔐 Security Features

- Firebase Authentication
- Secure data storage (Hive encryption ready)
- Input validation
- XSS prevention
- Sanitized user inputs

## 🎨 UI/UX Highlights

- **Consistent Design System** - Unified colors, typography, spacing
- **Accessibility** - High contrast, readable fonts, clear labels
- **Feedback** - Loading states, success/error messages, animations
- **Intuitive Navigation** - Bottom nav, clear routing, breadcrumbs
- **Responsive** - Adaptive layouts for different screen sizes

## 📈 Future Enhancements

- [ ] Multi-currency support
- [ ] Data export (CSV, PDF)
- [ ] Biometric authentication
- [ ] Expense splitting
- [ ] Bill reminders
- [ ] Investment tracking
- [ ] Financial goals
- [ ] Receipt scanning (OCR)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 👨‍💻 Developer

**Mohammadhusen Zhare**

- Portfolio: [Your Portfolio Link]
- LinkedIn: [Your LinkedIn]
- Email: [Your Email]

## 📄 License

This project is licensed under the MIT License.

---

<div align="center">

**Built with ❤️ using Flutter**

*Showcasing modern app development practices, clean architecture, and production-ready code*

</div>
