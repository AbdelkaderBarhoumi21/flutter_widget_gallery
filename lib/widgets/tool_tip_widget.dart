import 'package:flutter/material.dart';

class ToolTipWidget extends StatelessWidget {
  const ToolTipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message: 'Settings',
        child: Icon(Icons.settings, size: 80),
      ),
    );
  }
}
