import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/text_box.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../providers.dart';

class ChooseTime extends HookConsumerWidget {
  const ChooseTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDay = ref.watch(weekDayProvider)!;
    final subject = ref.watch(subjectProvider)!;

    return CustomScaffold(
      imageUrl: subject.imageUrl,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              weekDay,
              style: AppFonts.text24Bold.copyWith(color: AppColors.DOCTOR_BLUE),
            ),
            const SizedBox(
              height: 20,
            ),
            ...[14, 15, 16, 17]
                .map(
                  (e) => TextBox(
                    onClick: () {
                      ref.read(lessonProvider.notifier).update(
                            (state) => state.clone(endTime: '$e:00'),
                          );
                      ref.read(timeProvider.notifier).update(
                            (state) => '$e:00 - ${e + 1}:00',
                          );

                      ref.read(pageIndexProvider.notifier).update((state) => 3);
                    },
                    text: '$e:00 - ${e + 1}:00',
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
