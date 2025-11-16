class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Finance Manager';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int transactionsPerPage = 20;
  static const int categoriesPerPage = 50;

  // Budget Alerts
  static const double budgetWarningThreshold = 0.8; // 80%
  static const double budgetDangerThreshold = 1.0; // 100%

  // Recurring Detection
  static const int recurringDetectionMonths = 3;
  static const double recurringAmountTolerance = 0.05; // ±5%
  static const int recurringDateTolerance = 3; // days

  // Sync
  static const Duration syncInterval = Duration(minutes: 30);
  static const Duration syncTimeout = Duration(seconds: 30);

  // Date Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String monthYearFormat = 'MMMM yyyy';
  static const String monthFormat = 'yyyy-MM';

  // Default Categories
  static const List<Map<String, String>> defaultCategories = [
    {'name': 'Food', 'icon': '🍔', 'color': 'FF4CAF50'},
    {'name': 'Entertainment', 'icon': '🎬', 'color': 'FFFF9800'},
    {'name': 'Transport', 'icon': '🚗', 'color': 'FF2196F3'},
    {'name': 'Shopping', 'icon': '🛍️', 'color': 'FFE91E63'},
    {'name': 'Bills', 'icon': '📄', 'color': 'FF9C27B0'},
    {'name': 'Healthcare', 'icon': '🏥', 'color': 'FFF44336'},
    {'name': 'Education', 'icon': '📚', 'color': 'FF3F51B5'},
    {'name': 'Utilities', 'icon': '💡', 'color': 'FFFF5722'},
    {'name': 'Other', 'icon': '📦', 'color': 'FF607D8B'},
  ];

  // Payment Methods
  static const List<String> paymentMethods = [
    'Cash',
    'Debit Card',
    'Credit Card',
    'UPI',
    'Net Banking',
    'Wallet',
    'Other',
  ];

  // Recurring Frequencies
  static const List<String> recurringFrequencies = [
    'Daily',
    'Weekly',
    'Bi-weekly',
    'Monthly',
    'Quarterly',
    'Yearly',
  ];

  // Currencies
  static const Map<String, String> currencies = {
    'INR': '₹',
    'USD': '\$',
    'EUR': '€',
    'GBP': '£',
    'JPY': '¥',
  };

  static const String defaultCurrency = 'INR';

  // Smart Category Keywords
  static const Map<String, List<String>> categoryKeywords = {
    'Food': ['starbucks', 'coffee', 'tea', 'restaurant', 'cafe', 'food', 'zomato', 'swiggy', 'mcdonald', 'pizza', 'burger'],
    'Entertainment': ['movie', 'cinema', 'netflix', 'spotify', 'prime', 'youtube', 'game', 'gaming', 'steam', 'entertainment'],
    'Transport': ['uber', 'ola', 'petrol', 'diesel', 'fuel', 'taxi', 'cab', 'bus', 'train', 'metro', 'parking'],
    'Shopping': ['amazon', 'flipkart', 'shopping', 'mall', 'store', 'myntra', 'ajio', 'clothes', 'fashion'],
    'Bills': ['electricity', 'water', 'gas', 'broadband', 'internet', 'phone', 'mobile', 'postpaid', 'bill'],
    'Healthcare': ['doctor', 'hospital', 'medical', 'pharmacy', 'medicine', 'clinic', 'health'],
    'Education': ['school', 'college', 'university', 'course', 'book', 'tuition', 'education', 'learning'],
    'Utilities': ['electricity', 'water', 'gas', 'maintenance', 'repair', 'service'],
  };

  // Hive Box Names
  static const String transactionsBox = 'transactions';
  static const String categoriesBox = 'categories';
  static const String budgetsBox = 'budgets';
  static const String recurringTransactionsBox = 'recurring_transactions';
  static const String userProfileBox = 'user_profile';
  static const String settingsBox = 'settings';

  // SharedPreferences Keys
  static const String isDarkModeKey = 'is_dark_mode';
  static const String selectedCurrencyKey = 'selected_currency';
  static const String notificationsEnabledKey = 'notifications_enabled';
  static const String budgetAlertsEnabledKey = 'budget_alerts_enabled';
  static const String recurringRemindersEnabledKey = 'recurring_reminders_enabled';

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Spacing (8px grid system)
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;

  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusCircular = 100.0;

  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;

  // Button Heights
  static const double buttonHeightSmall = 36.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  // Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Chart Settings
  static const int maxChartMonths = 12;
  static const int defaultChartMonths = 6;

  // Error Messages
  static const String networkErrorMessage = 'No internet connection. Please check your network settings.';
  static const String serverErrorMessage = 'Something went wrong. Please try again later.';
  static const String authErrorMessage = 'Authentication failed. Please try logging in again.';
  static const String validationErrorMessage = 'Please check your input and try again.';

  // Success Messages
  static const String transactionAddedMessage = 'Transaction added successfully';
  static const String transactionUpdatedMessage = 'Transaction updated successfully';
  static const String transactionDeletedMessage = 'Transaction deleted successfully';
  static const String budgetCreatedMessage = 'Budget created successfully';
  static const String budgetUpdatedMessage = 'Budget updated successfully';
  static const String budgetDeletedMessage = 'Budget deleted successfully';
}
