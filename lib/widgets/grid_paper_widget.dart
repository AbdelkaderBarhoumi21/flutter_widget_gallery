import 'package:flutter/material.dart';

class GridPaperWidget extends StatelessWidget {
  const GridPaperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: GridPaper(
        color: Colors.blue,
        divisions: 1,
        interval: 200,
        subdivisions: 8,
      ),
    );
  }
}
