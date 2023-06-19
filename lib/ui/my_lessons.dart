import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_constants.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';
import 'package:lms_fiverr/constants/db_table.dart';
import 'package:lms_fiverr/models/lesson.model.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/services/database.dart';
import 'package:lms_fiverr/ui/shared/actions_widget.dart';
import 'package:lms_fiverr/ui/shared/custom_scaffold.dart';

class MyLessons extends HookConsumerWidget {
  const MyLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(studentProvider)!;
    final redo = useState<bool>(true);
    return FutureBuilder<List<Lesson>>(
      future: Database().getMyLessons(student.id),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return CustomScaffold(
            noAction: true,
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
                    'My Lessons',
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
                        .map((e) => ActionsWidget(
                              text: '${e.startTime}\n${e.endTime} - ${int.parse(e.endTime.split(':').first)+1}:00\n${e.status}',
                              imageUrl: e.subject!.imageUrl,
                              child: (e.status != 'Booked')
                                  ? null
                                  : Container(
                                      padding: const EdgeInsets.all(8),
                                      width: double.infinity,
                                      color: AppColors.CONTAINER_GREY_2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              e.status = 'Completed';
                                              await Database().insert(
                                                  DBTable.LESSON_TABLE,
                                                  {'id': e.id, ...e.toMap()});
                                              redo.value = !redo.value;
                                            },
                                            child: Text(
                                              'Mark as Completed',
                                              style: AppFonts.text12Bold
                                                  .copyWith(
                                                      color:
                                                          AppColors.DOCTOR_BLUE,
                                                      fontSize: 14),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            height: 1,
                                            width: double.infinity,
                                            color: AppColors.BLACK_SHADOW,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              e.status = 'Cancelled';
                                              await Database().insert(
                                                  DBTable.LESSON_TABLE,
                                                  {'id': e.id, ...e.toMap()});
                                              redo.value = !redo.value;
                                            },
                                            child: Text(
                                              'Mark as Cancelled',
                                              style: AppFonts.text12Bold
                                                  .copyWith(
                                                      color:
                                                          AppColors.DOCTOR_BLUE,
                                                      fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
