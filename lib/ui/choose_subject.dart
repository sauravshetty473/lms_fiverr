import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_constants.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';
import 'package:lms_fiverr/models/subject.model.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/services/database.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/image_text.dart';

class ChooseSubject extends HookConsumerWidget {
  const ChooseSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(studentProvider)!;
    return FutureBuilder<List<Subject>>(
      future: Database().getAllSubjects(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return CustomScaffold(
            body: Container(
              padding:
                  const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
              child: Column(
                children: [
                  Text(
                    'Welcome ${student.name}!',
                    style: AppFonts.text16SemiBold
                        .copyWith(color: AppColors.DOCTOR_BLUE),
                  ),
                  Text(
                    'Choose your lessons',
                    style: AppFonts.text24Bold
                        .copyWith(color: AppColors.DOCTOR_BLUE),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    children: snapshot.data!
                        .map((e) => ImageText(
                              onClick: () {
                                ref.read(lessonProvider.notifier).update(
                                      (state) => state.clone(subjectId: e.id),
                                    );
                                ref.read(subjectProvider.notifier).update(
                                      (state) => e,
                                    );

                                ref
                                    .read(pageIndexProvider.notifier)
                                    .update((state) => 1);
                              },
                              text: e.name,
                              imageUrl: e.imageUrl,
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
