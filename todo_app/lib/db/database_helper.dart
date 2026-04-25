import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todo_app.db');
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
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_email TEXT NOT NULL,
        task TEXT NOT NULL,
        is_done INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');
  }

  // ── USER METHODS ──────────────────────────────────────────

  Future<bool> registerUser(String email, String password) async {
    final db = await database;
    try {
      await db.insert('users', {
        'email': email.toLowerCase().trim(),
        'password': password,
      });
      return true;
    } catch (e) {
      return false; // email already exists
    }
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.toLowerCase().trim(), password],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // ── TASK METHODS ──────────────────────────────────────────

  Future<int> insertTask(String userEmail, String task) async {
    final db = await database;
    return await db.insert('tasks', {
      'user_email': userEmail.toLowerCase().trim(),
      'task': task.trim(),
      'is_done': 0,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getTasks(String userEmail) async {
    final db = await database;
    return await db.query(
      'tasks',
      where: 'user_email = ?',
      whereArgs: [userEmail.toLowerCase().trim()],
      orderBy: 'created_at DESC',
    );
  }

  Future<int> toggleTask(int id, bool isDone) async {
    final db = await database;
    return await db.update(
      'tasks',
      {'is_done': isDone ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
