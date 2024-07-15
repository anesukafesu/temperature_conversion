import 'package:flutter/material.dart';
import 'package:temperature_conversion/routes/home.dart';
import 'package:temperature_conversion/blocs/conversions.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider<ConversionsBloc>(
          create: (_) => ConversionsBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Comfortaa',
        ),
        home: const Home(),
      ),
    ),
  );
}
