import 'package:proyecto_flutter_alejandro/routes/imports.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // Obtiene la base de datos, la inicializa si es necesario
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  // Inicializa la base de datos en el archivo especificado
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

   // Crea la tabla de 'users' y agrega un usuario por defecto
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        totalCorrect INTEGER DEFAULT 0,
        totalIncorrect INTEGER DEFAULT 0,
        bestStreak INTEGER DEFAULT 0
      )
    ''');

    // Inserta usuario por defecto
    await db.insert('users', {
      'username': 'usuario',
      'password': 'usuario',
      'totalCorrect': 0,
      'totalIncorrect': 0,
      'bestStreak': 0
    });
  }

  // Inserta un nuevo usuario en la base de datos
  Future<int> insertUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Obtiene un usuario por su nombre de usuario
  Future<User?> getUser(String username) async {
    final db = await instance.database;
    final maps = await db.query('users', where: 'username = ?', whereArgs: [username]);

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

   // Actualiza las estadísticas de un usuario
  Future<int> updateStatistics(User user) async {
    final db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'username = ?',
      whereArgs: [user.username],
    );
  }

  // Autentica un usuario con su nombre de usuario y contraseña
  Future<User?> authenticateUser(String username, String password) async {
    final db = await instance.database;
    final maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}

