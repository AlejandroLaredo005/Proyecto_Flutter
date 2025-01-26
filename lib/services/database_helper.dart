import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        totalCorrect INTEGER DEFAULT 0,
        totalIncorrect INTEGER DEFAULT 0,
        bestStreak INTEGER DEFAULT 0
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUser(String username) async {
    final db = await instance.database;
    final maps = await db.query('users', where: 'username = ?', whereArgs: [username]);

    if (maps.isNotEmpty) {
      final map = maps.first;
      return User(
        username: map['username'] as String,
        password: map['password'] as String,
      );
    }
    return null;
  }

  Future<int> updateStatistics(User user) async {
    final db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'username = ?',
      whereArgs: [user.username],
    );
  }
}
