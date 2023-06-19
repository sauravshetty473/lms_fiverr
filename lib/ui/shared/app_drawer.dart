import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_constants.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/ui/my_lessons.dart';

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(studentProvider)!;
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
            color: AppColors.DOCTOR_BLUE,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/thumbnails/005/545/335/small/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    student.name,
                    style: AppFonts.text20Bold,
                  ),
                  Text(
                    student.username,
                    style: AppFonts.text12Light,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppConstants.BOX_PADDING_HORIZONTAL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.home,
                      color: AppColors.DOCTOR_BLUE,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Home',
                      style: AppFonts.text12
                          .copyWith(color: AppColors.DOCTOR_BLUE),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    while (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyLessons(),
                      ),
                    );
                  },
                  child: Text(
                    '          My Lessons',
                    style:
                        AppFonts.text12.copyWith(color: AppColors.DOCTOR_BLUE),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          GestureDetector(
            onTap: () {
              ref.read(studentProvider.notifier).update((state) => null);
            },
            child: Container(
              color: AppColors.DOCTOR_BLUE,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.BOX_PADDING_HORIZONTAL,
                  vertical: 12),
              child: Text(
                'Log out',
                style: AppFonts.text16Bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
