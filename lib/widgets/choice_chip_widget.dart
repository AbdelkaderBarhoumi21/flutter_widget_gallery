import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({super.key});

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text('Choice'),
      avatar: Icon(Icons.person),
      selected: _isSelected,
      onSelected: (bool selected) {
        setState(() {
          _isSelected = selected;
        });
      },
    );
  }
}
