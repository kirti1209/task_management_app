import 'package:flutter/material.dart';

class ColorConstants {
  // Gradient colors
  static const Color gradientStart = Color(0xFFFFA34C);
  static const Color gradientEnd = Color(0xFFFF4D30);
  
  // Solid colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF717182);
  static const Color red = Color(0xFFE7442C);
  static const Color orange = Color(0xFFFF8D45);
  static const Color fieldLabelColor = Color(0xFF310A12);
  static const Color cardColor = Color(0xD9FFFFFF); // #FFFFFFD9 - 85% opacity
  static const Color dateActive = Color(0xD9FFFFFF);   // #FFFFFFD9 - 85% opacity selected
  static const Color dateInactive = Color(0x33FFFFFF); // #FFFFFF33 - 20% opacity not selected
  
  // Stats card colors
  static const Color iconBgBlue = Color(0xFFDBEAFE);  // #DBEAFE
  static const Color iconBgRed = Color(0xFFFEE2E2);   // #FEE2E2
  static const Color textBlack = Color(0xFF141414);   // #141414
  static const Color textGrey = Color(0xFF6B7280);    // #6B7280
  
  // Page and button colors
  static const Color pageBgDimWhite = Color(0xFFF5F5F5);  // Dim white background
  static const Color startPointBg = Color(0xFFFBD1CB);     // #FBD1CB
  static const Color startPointText = Color(0xFFDC2626);   // #DC2626
  static const Color allTaskButtonYellow = Color(0xFFF5B400);
  static const Color pendingChipBg = Color(0xFFFFF1CC);
  static const Color pendingChipText = Color(0xFFF5B400);
  static const Color inputBg = Color(0xFFF3F3F5);
  static const Color disabledButtonGray = Color(0xFFAAAAAA);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientStart, gradientEnd],
  );

  // Note box colors
  static const Color noteBorderBlue = Color(0xFF5DA4FF);
  static const Color noteTextMuted = Color(0xFF838592);
  static const Color noteBgBlueLight = Color(0xFFEFF6FF);

}
