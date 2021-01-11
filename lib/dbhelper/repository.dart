import 'package:sqflite/sqflite.dart';
import 'package:todo_list/dbhelper/database_connection.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  //INSERT
  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}
