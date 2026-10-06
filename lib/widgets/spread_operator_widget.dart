import 'package:flutter/material.dart';

class SpreadOperatorWidget extends StatefulWidget {
  const SpreadOperatorWidget({super.key});

  @override
  State<SpreadOperatorWidget> createState() => _SpreadOperatorWidgetState();
}

class _SpreadOperatorWidgetState extends State<SpreadOperatorWidget> {
  List<Widget> iconList = [
    Icon(Icons.home),
    Icon(Icons.settings),
    Icon(Icons.menu),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(spacing: 16, children: [Icon(Icons.person), ...iconList]);
  }
}
