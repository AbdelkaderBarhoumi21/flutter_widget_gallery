import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left: 40,
              top: 40,
              child: Image.asset('assets/image.jpg', height: 200, width: 250),
            ),
            Positioned(
              left: 80,
              top: 80,
              child: Image.asset('assets/image.jpg', height: 200, width: 250),
            ),
            Positioned(
              left: 120,
              top: 120,
              child: Image.asset('assets/image.jpg', height: 200, width: 250),
            ),
          ],
        ),
      ),
    );
  }
}
