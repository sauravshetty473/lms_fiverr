import 'package:flutter/material.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';

class TextBox extends StatelessWidget {
  final String text;
  final Function? onClick;

  const TextBox({Key? key, required this.text, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick == null) return;
        onClick!();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: AppColors.DOCTOR_BLUE,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 0,
                  offset: Offset(0, 12),
                  spreadRadius: -8)
            ]),
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            text,
            style: AppFonts.text16SemiBold,
          ),
        ),
      ),
    );
  }
}
