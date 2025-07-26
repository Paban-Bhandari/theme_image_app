import 'package:flutter/material.dart';

/// App-wide constants and configuration values.
class AppConstants {
  // Colors
  static const Color primaryBlue = Color(0xFF2193b0);
  static const Color secondaryBlue = Color(0xFF6dd5ed);
  static const Color lightBlue = Color(0xFFbde6fa);
  static const Color darkGradientStart = Color(0xFF232526);
  static const Color darkGradientEnd = Color(0xFF414345);

  // Gradients
  static const LinearGradient lightGradient = LinearGradient(
    colors: [secondaryBlue, lightBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkGradientStart, darkGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dimensions
  static const double cardElevation = 8.0;
  static const double buttonElevation = 6.0;
  static const double borderRadius = 16.0;
  static const double smallBorderRadius = 10.0;
  static const double iconSize = 32.0;
  static const double smallIconSize = 20.0;

  // Durations
  static const Duration shortAnimation = Duration(milliseconds: 300);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration snackBarDuration = Duration(seconds: 2);

  // Responsive breakpoints
  static const double wideScreenBreakpoint = 600.0;

  // Image settings
  static const int maxImageWidth = 1000;
  static const int maxImageHeight = 1000;
  static const int imageQuality = 85;
}

/// Helper functions for common operations.
class AppHelpers {
  /// Gets the appropriate gradient based on theme mode.
  static LinearGradient getThemeGradient(bool isDarkMode) {
    return isDarkMode ? AppConstants.darkGradient : AppConstants.lightGradient;
  }

  /// Gets the appropriate text color based on theme mode.
  static Color getTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : AppConstants.primaryBlue;
  }

  /// Gets the appropriate secondary text color based on theme mode.
  static Color getSecondaryTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.grey[300]! : Colors.grey[700]!;
  }
}
