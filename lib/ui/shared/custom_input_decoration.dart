import 'package:flutter/material.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class CustomInputDecoration {
  static final InputDecoration USERNAME_INPUT = InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      prefixIcon: const Icon(Icons.person),
      hintText: 'Username',
      hintStyle: AppFonts.text16Light
          .copyWith(color: AppColors.DOCTOR_BLUE.withOpacity(0.5)));

  static final InputDecoration PASSWORD_INPUT = InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      prefixIcon: const Icon(Icons.lock),
      hintText: 'Password',
      hintStyle: AppFonts.text16Light
          .copyWith(color: AppColors.DOCTOR_BLUE.withOpacity(0.5)));
}
