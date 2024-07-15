import 'package:flutter/material.dart';

class TranslucentCard extends StatelessWidget {
  final Widget child;
  const TranslucentCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.3),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}
