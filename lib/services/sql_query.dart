import '../constants/db_table.dart';
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class SQLQuery {
  static const String STUDENT_TABLE = '''
          CREATE TABLE ${DBTable.STUDENT_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            username TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''';

  static const String TEACHER_TABLE = '''
          CREATE TABLE ${DBTable.TEACHER_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            subject_id INTEGER NOT NULL,
            image_url TEXT,
            FOREIGN KEY (subject_id) REFERENCES Subjects (id)
          )
        ''';

  static const String SUBJECT_TABLE = '''
          CREATE TABLE ${DBTable.SUBJECT_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            image_url TEXT
          )
        ''';

  static const String LESSON_TABLE = '''
          CREATE TABLE ${DBTable.LESSON_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER NOT NULL,
            teacher_id INTEGER NOT NULL,
            subject_id INTEGER NOT NULL,
            start_time TEXT NOT NULL,
            end_time TEXT NOT NULL,
            status TEXT NOT NULL,
            FOREIGN KEY (student_id) REFERENCES ${DBTable.STUDENT_TABLE} (id),
            FOREIGN KEY (teacher_id) REFERENCES ${DBTable.TEACHER_TABLE} (id),
            FOREIGN KEY (subject_id) REFERENCES ${DBTable.SUBJECT_TABLE} (id)
          )
        ''';
}
