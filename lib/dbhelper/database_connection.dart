import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = directory.path + 'todo.db';
    var database = await openDatabase(path, version: 1, onCreate: _createDb);
    return database;
  }

  _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT)");
  }
}
