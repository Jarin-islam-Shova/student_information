import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/student.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'student_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, email TEXT, location TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertStudent(Student student) async {
    final db = await database;
    await db.insert(
      'students',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('students');
    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phone: maps[i]['phone'],
        email: maps[i]['email'],
        location: maps[i]['location'],
      );
    });
  }

  Future<void> updateStudent(Student student) async {
    final db = await database;
    await db.update(
      'students',
      student.toMap(),
      where: "id = ?",
      whereArgs: [student.id],
    );
  }

  Future<void> deleteStudent(int id) async {
    final db = await database;
    await db.delete(
      'students',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}