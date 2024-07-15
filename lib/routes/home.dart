import 'package:flutter/material.dart';
import 'package:temperature_conversion/components/converter.dart';
import 'package:temperature_conversion/components/history.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final int _breakPoint = 500;

  @override
  Widget build(BuildContext context) {
    List<Widget> pageContent;

    if (MediaQuery.of(context).size.width < _breakPoint) {
      pageContent = const [
        Flexible(
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
        )
      ];
    } else {
      pageContent = const [
        Flexible(
          child: Converter(),
        ),
        Flexible(
          child: Expanded(
            child: History(),
          ),
        ),
      ];
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Flex(
            direction: Axis.horizontal,
            children: pageContent,
          ),
        ),
      ),
    );
  }
}
