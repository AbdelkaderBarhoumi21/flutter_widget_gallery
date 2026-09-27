import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  const FittedBoxWidget({required this.withFittedBox, super.key});
  final bool withFittedBox;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      color: Colors.red,
      padding: const EdgeInsets.all(8),
      child: withFittedBox
          ? FittedBox(
              child: const Text(
                "Flutter FittedBox",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : const Text(
              "Flutter FittedBox",
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
