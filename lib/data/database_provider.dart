import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final DatabaseProvider databaseProvider = DatabaseProvider._();
  DatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      await _initialiseDatabase();
    }

    return _database!;
  }

  // Function to initialise database
  Future<void> _initialiseDatabase() async {
    String databasesPath = await getDatabasesPath();
    String databasePath = join(databasesPath, 'data.db');
    _database = await openDatabase(
      databasePath,
      version: 2,
      onCreate: (Database database, int version) {
        // Create the history table
        database.execute(
          "CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, input_unit TEXT,result_unit TEXT,input REAL,result REAL);",
        );
      },
    );
  }
}
