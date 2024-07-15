import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String label;
  const Heading({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
