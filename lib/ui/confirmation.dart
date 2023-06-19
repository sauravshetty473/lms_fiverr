import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_fonts.dart';

class Confirmation extends HookConsumerWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider)!;
    final weekday = ref.watch(weekDayProvider)!;
    final subject = ref.watch(subjectProvider)!;
    final teacher = ref.watch(teacherProvider)!;

    return CustomScaffold(
      imageUrl: subject.imageUrl,
      body: Container(
        padding: const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
        child: Column(
          children: [
            Text(
              'Lesson Booked',
              style: AppFonts.text16SemiBold
                  .copyWith(color: AppColors.DOCTOR_BLUE),
            ),
            Text(
              weekday,
              style: AppFonts.text24Bold.copyWith(color: AppColors.DOCTOR_BLUE),
            ),
            Text(
              time,
              style: AppFonts.text24Bold.copyWith(color: AppColors.DOCTOR_BLUE),
            ),
            Text(
              teacher,
              style: AppFonts.text24Bold.copyWith(color: AppColors.DOCTOR_BLUE),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.check_circle_outline_rounded,
              color: AppColors.PUNK_GREEN,
              size: 140,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.BLACK.withOpacity(0.6),
                ),
              ),
              onPressed: ([mounted = true]) {
                ref.read(pageIndexProvider.notifier).update((state) => 0);
              },
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    'Back To Home',
                    style: AppFonts.text20.copyWith(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
