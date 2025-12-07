import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const lightBlack = Color(0xff1c1c1c);
  static const white = Color(0xffffffff);
  static const lightWhite = Color(0xffe5e5e5);
}

class AppTheme {
  static final focus = GoogleFonts.inter(
    color: AppColors.lightWhite,
    fontSize: 48,
    height: 1.3,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
  );
}
