import 'package:lms_fiverr/constants/db_table.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class Student {
  final int id;
  final String name;
  final String username;
  final String password;

  Student({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
    };
  }
}

class Teacher {
  final int id;
  final String name;
  final int subjectId;
  final String imageUrl;

  Teacher({
    required this.id,
    required this.name,
    required this.subjectId,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'subject_id': subjectId,
      'image_url': imageUrl,
    };
  }
}

class Subject {
  final int id;
  final String name;
  final String imageUrl;

  Subject({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
    };
  }
}

class Lesson {
  final int id;
  final int studentId;
  final int teacherId;
  final String startTime;
  final String endTime;
  final String status;

  Lesson({
    required this.id,
    required this.studentId,
    required this.teacherId,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'teacher_id': teacherId,
      'start_time': startTime,
      'end_time': endTime,
      'status': status,
    };
  }
}

class Database {
  static final Database _singleton = Database._internal();
  static sql.Database? _db;

  factory Database() {
    return _singleton;
  }

  Database._internal();

  Future<sql.Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDatabase();
    return _db!;
  }

  Future<sql.Database> _initDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final pathToDatabase = path.join(dbPath, 'my_database.db');

    return await sql.openDatabase(
      pathToDatabase,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE ${DBTable.STUDENT_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            username TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE ${DBTable.TEACHER_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            subject_id INTEGER NOT NULL,
            image_url TEXT,
            FOREIGN KEY (subject_id) REFERENCES Subjects (id)
          )
        ''');

        await db.execute('''
          CREATE TABLE ${DBTable.SUBJECT_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            image_url TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE ${DBTable.LESSON_TABLE} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER NOT NULL,
            teacher_id INTEGER NOT NULL,
            start_time TEXT NOT NULL,
            end_time TEXT NOT NULL,
            status TEXT NOT NULL,
            FOREIGN KEY (student_id) REFERENCES Students (id),
            FOREIGN KEY (teacher_id) REFERENCES Teachers (id)
          )
        ''');
      },
    );
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> recordExists(String table, int id) async {
    final db = await database;
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }

  Future<Map<String, dynamic>?> getValueById(String table, int id) async {
    final db = await database;
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<Student> getStudentByUsername(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'Students',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return Student(
        id: result[0]['id'] as int,
        name: result[0]['name'] as String,
        username: result[0]['username'] as String,
        password: result[0]['password'] as String,
      );
    }

    throw Exception('Student not found');
  }

  Future<List<String>> getTableNames() async {
    final db = await database;
    final result = await db.query('sqlite_master', where: 'type = ?', whereArgs: ['table']);

    return result.map((row) => row['name'] as String).toList();
  }


  Future<void> deleteDatabaseCustom() async {
    final dbRef = await database;

    await sql.deleteDatabase(dbRef.path);
    _db = null;
  }
}
