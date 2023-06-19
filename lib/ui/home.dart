import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/ui/choose_subject.dart';
import 'package:lms_fiverr/ui/choose_teacher.dart';
import 'package:lms_fiverr/ui/choose_time.dart';
import 'package:lms_fiverr/ui/choose_weekday.dart';

import '../providers.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    return [
      ChooseSubject(),
      ChooseWeekDay(),
      ChooseTime(),
      ChooseTeacher(),
    ][pageIndex];
  }
}
