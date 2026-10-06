import 'package:flutter/material.dart';

class CheckBoxTileWidget extends StatefulWidget {
  const CheckBoxTileWidget({super.key});

  @override
  State<CheckBoxTileWidget> createState() => _CheckBoxTileWidgetState();
}

class _CheckBoxTileWidgetState extends State<CheckBoxTileWidget> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CheckboxListTile(
        value: _isChecked,
        title: const Text('Remember me'),
        subtitle: const Text('Subtitle'),
        activeColor: Colors.red,
        checkColor: Colors.white,
        tileColor: Colors.blue,
        controlAffinity: ListTileControlAffinity.leading,
        tristate: true,
        onChanged: (bool? newValue) {
          setState(() {
            _isChecked = newValue;
          });
        },
      ),
    );
  }
}
