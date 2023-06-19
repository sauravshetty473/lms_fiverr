import 'dart:math';

class Lesson {
  final int id;
  final int studentId;
  final int teacherId;
  final int subjectId;
  final String startTime;
  final String endTime;
  final String status;

  Lesson({
    this.id = 1,
    required this.studentId,
    required this.teacherId,
    required this.subjectId,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'student_id': studentId,
      'teacher_id': teacherId,
      'subject_id': subjectId,
      'start_time': startTime,
      'end_time': endTime,
      'status': status,
    };
  }

  Lesson clone({
    int? id,
    int? studentId,
    int? teacherId,
    int? subjectId,
    String? startTime,
    String? endTime,
    String? status,
  }) {
    return Lesson(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      teacherId: teacherId ?? this.teacherId,
      subjectId: subjectId ?? this.subjectId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
    );
  }

  static Lesson getRandomLesson() {
    final random = Random();
    final id = random.nextInt(100);
    final studentId = random.nextInt(100);
    final teacherId = random.nextInt(100);
    final subjectId = random.nextInt(100);
    const startTime = '9:00 AM';
    const endTime = '10:00 AM';
    const status = 'Scheduled';

    return Lesson(
      id: id,
      studentId: studentId,
      teacherId: teacherId,
      subjectId: subjectId,
      startTime: startTime,
      endTime: endTime,
      status: status,
    );
  }
}
