import 'package:flutter/material.dart';

class ShowTimePickerWidget extends StatefulWidget {
  const ShowTimePickerWidget({super.key});

  @override
  State<ShowTimePickerWidget> createState() => _ShowTimePickerWidgetState();
}

class _ShowTimePickerWidgetState extends State<ShowTimePickerWidget> {
  TimeOfDay? _time = const TimeOfDay(hour: 12, minute: 12);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        children: [
          Text(
            '${_time!.hour.toString()} : ${_time!.minute.toString()}',
            style: TextStyle(fontSize: 60),
          ),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: _time!,
              );
              if (newTime != null) {
                setState(() {
                  _time = newTime;
                });
              }
            },
            child: Text("Choose a time"),
          ),
        ],
      ),
    );
  }
}
