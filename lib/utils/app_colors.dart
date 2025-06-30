import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0A0A0A);
  static const Color secondaryColor = Color(0xFF1A1A1A);
  static const Color accentColor = Color(0xFFFF6B35);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color cardColor = Color(0xFF2A2A2A);

  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0A0A0A), Color(0xFF1A1A1A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF8E35)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
