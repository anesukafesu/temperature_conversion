import 'dart:async';
import 'package:temperature_conversion/data/conversions_dao.dart';
import 'package:temperature_conversion/models/conversion.dart';

class ConversionsBloc {
  // Instantiating the ConversionsDao
  final _conversionsDao = ConversionsDao();

  // Creating a stream controller for the conversion history
  final _conversionsStreamController =
      StreamController<List<Conversion>>.broadcast();

  // Creating a conversions getter that returns the conversions stream
  Stream<List<Conversion>> get conversions =>
      _conversionsStreamController.stream;

  ConversionsBloc() {
    // Initialise the stream with initial data
    _updateConversionsStream();
  }

  Future<void> _updateConversionsStream() async {
    // Read data from database and write to stream
    List<Conversion> conversions = await _conversionsDao.getAllConversions();
    _conversionsStreamController.sink.add(conversions);
  }

  Future<void> addConversion(Conversion conversion) async {
    await _conversionsDao.addConversion(conversion);
    _updateConversionsStream();
  }

  Future<void> deleteConversion(int id) async {
    await _conversionsDao.deleteConversion(id);
    _updateConversionsStream();
  }

  void dispose() {
    _conversionsStreamController.close();
  }
}
