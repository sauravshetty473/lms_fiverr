import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/services/sql_query.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

import '../models/student.model.dart';

final dbProvider = Provider((ref) => Database());

class Database {
  static Database? _singleton;
  static sql.Database? _db;

  factory Database() {
    _singleton ??= Database._internal();
    return _singleton!;
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
        await db.execute(SQLQuery.STUDENT_TABLE);
        await db.execute(SQLQuery.TEACHER_TABLE);
        await db.execute(SQLQuery.SUBJECT_TABLE);
        await db.execute(SQLQuery.LESSON_TABLE);
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

    throw Exception('Incorrect username or password!');
  }

  Future<List<String>> getTableNames() async {
    final db = await database;
    final result = await db
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);

    return result.map((row) => row['name'] as String).toList();
  }

  Future<void> deleteDatabaseCustom() async {
    final dbRef = await database;

    await sql.deleteDatabase(dbRef.path);
    _db = null;
  }
}
