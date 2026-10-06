import 'package:flutter/material.dart';

class SelectableTextWidget extends StatefulWidget {
  const SelectableTextWidget({super.key});

  @override
  State<SelectableTextWidget> createState() => _SelectableTextWidgetState();
}

class _SelectableTextWidgetState extends State<SelectableTextWidget> {
  String selectedText = '';
  final String selectableText = 'This is a selectable text';
  final TextStyle _styleBlue = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  final TextStyle _style = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(selectedText, style: _styleBlue),
          SelectableText(
            selectableText,
            style: _style,
            onSelectionChanged: (selection, cause) {
              setState(() {
                selectedText = selectableText.substring(
                  selection.start,
                  selection.end,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
