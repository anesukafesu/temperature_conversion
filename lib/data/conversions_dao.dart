import 'package:temperature_conversion/data/database_provider.dart';
import 'package:temperature_conversion/models/conversion.dart';

class ConversionsDao {
  final _databaseProvider = DatabaseProvider.databaseProvider;

  // Function to insert item a new conversion in the database
  Future<void> addConversion(Conversion conversion) async {
    final db = await _databaseProvider.database;
    await db.insert('history', conversion.toMap());
  }

  // Function to get all conversions from the database
  Future<List<Conversion>> getAllConversions() async {
    final db = await _databaseProvider.database;
    final rows = await db.query('history');
    return rows.map((row) => Conversion.fromMap(row)).toList();
  }

  // Function to delete a conversion from the database
  Future<void> deleteConversion(int id) async {
    final db = await _databaseProvider.database;
    await db.delete('history', where: 'id = ?', whereArgs: [id]);
  }
}
