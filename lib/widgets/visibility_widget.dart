import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Is visible text", style: TextStyle(fontSize: 60)),
            Visibility(
              visible: _isVisible,
              child: Text("Is invisible", style: TextStyle(fontSize: 60)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Text("Switch"),
            ),
          ],
        ),
      ),
    );
  }
}
