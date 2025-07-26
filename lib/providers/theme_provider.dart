import 'package:flutter/material.dart';

/// A simple theme provider for managing app theme state.
/// This can be extended to use Provider, Riverpod, or Bloc in the future.
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
}
