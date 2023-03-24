import 'package:sqflite/sqflite.dart';

class DatabaseCore {
  static const _databaseName = "finance.db";
  static const _databaseVersion = 1;

  static const table = 'finance';
  static const columnId = 'id';
  static const columnDescription = 'description';
  static const columnAmount = 'amount';
  static const columnDate = 'date';
  static const columnType = 'type';

  DatabaseCore._privateConstructor();
  static final DatabaseCore instance = DatabaseCore._privateConstructor();

  static Database? _database;
  
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = await getDatabasesPath() + _databaseName;
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnDescription TEXT NOT NULL,
            $columnAmount REAL NOT NULL,
            $columnDate TEXT NOT NULL,
            $columnType INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryRowsByDates(String startDate, String endDate) async {
    Database db = await instance.database;
    return await db.query(table, where: '$columnDate BETWEEN ? AND ?', whereArgs: [startDate, endDate]);

  }

  Future<int> delete(String id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

}