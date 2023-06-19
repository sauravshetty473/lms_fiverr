import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/models/teacher.model.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';
import 'package:lms_fiverr/ui/shared/image_text.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_fonts.dart';
import '../services/database.dart';

class ChooseTeacher extends HookConsumerWidget {
  const ChooseTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider)!;
    final subject = ref.watch(subjectProvider)!;
    final loading = useState<bool>(false);

    return loading.value
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : FutureBuilder<List<Teacher>>(
            future: Database().getAllTeachers(subject.id),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return CustomScaffold(
                  imageUrl: subject.imageUrl,
                  body: Container(
                    padding: const EdgeInsets.all(
                        AppConstants.BOX_PADDING_HORIZONTAL),
                    child: Column(
                      children: [
                        Text(
                          time,
                          style: AppFonts.text16SemiBold
                              .copyWith(color: AppColors.DOCTOR_BLUE),
                        ),
                        Text(
                          'Choose your teacher',
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
                              .map(
                                (professor) => ImageText(
                                  onClick: ([mounted = true]) async {
                                    if (loading.value) return;
                                    loading.value = true;
                                    ref.read(lessonProvider.notifier).update(
                                          (state) => state.clone(
                                              teacherId: professor.id),
                                        );
                                    ref.read(teacherProvider.notifier).update(
                                          (state) => professor.name,
                                        );

                                    try {
                                      await Future.wait([
                                        Database().addLessonToDatabase(
                                            ref.read(lessonProvider)),
                                        Future.delayed(
                                            const Duration(seconds: 2))
                                      ]);
                                      ref
                                          .read(pageIndexProvider.notifier)
                                          .update((state) => 4);
                                    } catch (e) {
                                      Fluttertoast.showToast(
                                        msg:
                                            '${professor.name} is already booked!',
                                      );
                                    }
                                    loading.value = false;
                                  },
                                  text: professor.name,
                                  imageUrl: professor.imageUrl,
                                ),
                              )
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
            });
  }
}
