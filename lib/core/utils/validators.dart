class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }

    final cleanValue = value.replaceAll(RegExp(r'[₹\$€£¥,\s]'), '');

    final amount = double.tryParse(cleanValue);
    if (amount == null) {
      return 'Please enter a valid amount';
    }

    if (amount <= 0) {
      return 'Amount must be greater than 0';
    }

    if (amount > 10000000000) {
      // 10 billion limit
      return 'Amount is too large';
    }

    return null;
  }

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'Please enter a valid 10-digit phone number';
    }

    return null;
  }

  static String? validateBudgetLimit(String? value) {
    if (value == null || value.isEmpty) {
      return 'Budget limit is required';
    }

    final cleanValue = value.replaceAll(RegExp(r'[₹\$€£¥,\s]'), '');

    final amount = double.tryParse(cleanValue);
    if (amount == null) {
      return 'Please enter a valid budget limit';
    }

    if (amount <= 0) {
      return 'Budget limit must be greater than 0';
    }

    if (amount > 100000000) {
      // 100 million limit
      return 'Budget limit is too large';
    }

    return null;
  }

  static String? validateDescription(String? value, {int maxLength = 500}) {
    if (value != null && value.length > maxLength) {
      return 'Description must not exceed $maxLength characters';
    }
    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  static String? validateDate(DateTime? value) {
    if (value == null) {
      return 'Please select a date';
    }

    final now = DateTime.now();
    final futureLimit = now.add(const Duration(days: 365));

    if (value.isAfter(futureLimit)) {
      return 'Date cannot be more than 1 year in the future';
    }

    return null;
  }
}
