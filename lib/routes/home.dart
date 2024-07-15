import 'package:flutter/material.dart';
import 'package:temperature_conversion/components/converter.dart';
import 'package:temperature_conversion/components/history.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Converter(),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: History(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
