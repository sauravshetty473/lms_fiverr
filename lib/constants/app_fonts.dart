import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  static final TextStyle text24Bold = GoogleFonts.lexend(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.WHITE,
  );
  static final TextStyle text24SemiBold = GoogleFonts.lexend(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.WHITE,
  );
  static final TextStyle text24 = GoogleFonts.lexend(
    fontSize: 24,
    color: AppColors.WHITE,
  );
  static final TextStyle text24Light = GoogleFonts.lexend(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: AppColors.WHITE,
  );

  static final TextStyle text20Bold = text24Bold.copyWith(fontSize: 20);
  static final TextStyle text20SemiBold = text24SemiBold.copyWith(fontSize: 20);
  static final TextStyle text20 = text24.copyWith(fontSize: 20);
  static final TextStyle text20Light = text24Light.copyWith(fontSize: 20);

  static final TextStyle text16Bold = text24Bold.copyWith(fontSize: 16);
  static final TextStyle text16SemiBold = text24SemiBold.copyWith(fontSize: 16);
  static final TextStyle text16 = text24.copyWith(fontSize: 16);
  static final TextStyle text16Light = text24Light.copyWith(fontSize: 16);

  static final TextStyle text12Bold = text24Bold.copyWith(fontSize: 12);
  static final TextStyle text12SemiBold = text24SemiBold.copyWith(fontSize: 12);
  static final TextStyle text12 = text24.copyWith(fontSize: 12);
  static final TextStyle text12Light = text24Light.copyWith(fontSize: 12);
}
