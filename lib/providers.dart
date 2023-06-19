import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/models/lesson.model.dart';
import 'package:lms_fiverr/models/student.model.dart';
import 'package:lms_fiverr/models/subject.model.dart';

final studentProvider = StateProvider<Student?>((ref) => null);

final pageIndexProvider = StateProvider<int>((ref) => 0);

final lessonProvider = StateProvider<Lesson>((ref) {
  final student = ref.watch(studentProvider);
  return Lesson.getRandomLesson().clone(studentId: student?.id ?? 1);
});

final subjectProvider = StateProvider<Subject?>((ref) {
  return null;
});

final weekDayProvider = StateProvider<String?>((ref) {
  return null;
});

final timeProvider = StateProvider<String?>((ref) {
  return null;
});

final teacherProvider = StateProvider<String?>((ref) {
  return null;
});