import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/app_constants.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/text_box.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class ChooseWeekDay extends HookConsumerWidget {
  const ChooseWeekDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(subjectProvider)!;
    return CustomScaffold(
      imageUrl: subject.imageUrl,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.BOX_PADDING_HORIZONTAL),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              subject.name,
              style: AppFonts.text24Bold.copyWith(color: AppColors.DOCTOR_BLUE),
            ),
            const SizedBox(
              height: 20,
            ),
            ...['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
                .map(
                  (e) => TextBox(
                    onClick: () {
                      ref.read(lessonProvider.notifier).update(
                            (state) => state.clone(startTime: e),
                          );
                      ref.read(weekDayProvider.notifier).update(
                            (state) => e,
                          );

                      ref.read(pageIndexProvider.notifier).update((state) => 2);
                    },
                    text: e,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
