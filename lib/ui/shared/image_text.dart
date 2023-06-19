import 'package:flutter/material.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';

class ImageText extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool alter;
  final Function? onClick;

  const ImageText(
      {Key? key,
      required this.imageUrl,
      required this.text,
      this.onClick,
      this.alter = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick == null
          ? null
          : () {
              if (onClick == null) return;
              onClick!();
            },
      child: Container(
        padding: const EdgeInsets.all(2).copyWith(bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.BLACK_SHADOW),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppFonts.text16Bold.copyWith(
                    color: AppColors.DOCTOR_BLUE, fontSize: alter ? 12 : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
