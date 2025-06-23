import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1976D2);
  static const secondary = Color(0xFF64B5F6);
  static const accent = Color(0xFFFFD600);
  static const card = Color(0xFFF5F5F5);
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF888888);
}

class AppSettings extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isLargeText = false;

  bool get isDarkMode => _isDarkMode;
  bool get isLargeText => _isLargeText;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  double get textScaleFactor => _isLargeText ? 1.3 : 1.0;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void toggleLargeText(bool value) {
    _isLargeText = value;
    notifyListeners();
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  scaffoldBackgroundColor: Colors.white,
  cardColor: AppColors.card,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: const Color(0xFF1E1E1E),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
); 