import 'package:flutter/material.dart';

/// Tokens básicos do design system: cores, tipografia e espaçamentos.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF0069C0);
  static const Color primaryVariant = Color(0xFF004A8F);
  static const Color secondary = Color(0xFF00A896);
  static const Color background = Color(0xFFF6F8FA);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Colors.white;
  static const Color onBackground = Color(0xFF111827);
  static const Color disabled = Color(0xFF9CA3AF);
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.onBackground,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.onBackground,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.onPrimary,
  );
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}
