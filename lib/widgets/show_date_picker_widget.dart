import 'package:flutter/material.dart';

class ShowDatePickerWidget extends StatefulWidget {
  const ShowDatePickerWidget({super.key});

  @override
  State<ShowDatePickerWidget> createState() => _ShowDatePickerWidgetState();
}

class _ShowDatePickerWidgetState extends State<ShowDatePickerWidget> {
  DateTime _time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ElevatedButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: _time,
              firstDate: DateTime(2000),
              lastDate: DateTime(2026, 12, 31),
            );
            if (newDate != null) {
              setState(() {
                _time = newDate;
              });
            }
          },
          child: Text("Choose a date"),
        ),
        Text(
          '${_time.day} - ${_time.month} - ${_time.year}',
          style: TextStyle(fontSize: 60),
        ),
      ],
    );
  }
}
