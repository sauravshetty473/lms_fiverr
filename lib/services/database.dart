import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

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
        // You can create the necessary tables here
        await createTableIfNotExists(db, 'my_table');
      },
    );
  }

  Future<void> createTableIfNotExists(sql.Database db, String table) async {
    final query = '''
      CREATE TABLE IF NOT EXISTS $table (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''';
    await db.execute(query);
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    await createTableIfNotExists(db, table); // Create the table if it doesn't exist
    return await db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    await createTableIfNotExists(db, table); // Create the table if it doesn't exist
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> recordExists(String table, int id) async {
    final db = await database;
    await createTableIfNotExists(db, table); // Create the table if it doesn't exist
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty;
  }

  Future<Map<String, dynamic>?> getValueById(String table, int id) async {
    final db = await database;
    await createTableIfNotExists(db, table); // Create the table if it doesn't exist
    final result = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
