import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/models/lesson.model.dart';

final studentIDProvider = StateProvider<int?>((ref) => null);

final pageIndexProvider = StateProvider<int>((ref) => 0);

final lessonProvider = StateProvider.autoDispose<Lesson>((ref) {
  final studentID = ref.read(studentIDProvider)!;
  return Lesson.getRandomLesson().clone(studentId: studentID);
});
