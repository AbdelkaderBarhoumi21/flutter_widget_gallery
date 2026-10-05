import 'package:flutter/material.dart';

/// Expanded is just Flexible with one setting forced on: fit: FlexFit.tight — meaning it must fill all the space given to it.
class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // If we add all FlexFit.tight it will not care about height => it will be equal to Expanded to take the remaining space.
    // If we add FlexFit.loose it will take the height of the child and not care about the remaining space.
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(color: Colors.red, height: 50),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(color: Colors.blue, height: 100),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(color: Colors.green, height: 150),
          ),
        ],
      ),
    );
  }
}
