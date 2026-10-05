import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({super.key});

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _values = const RangeValues(0.1, 1.0);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      _values.start.toString(),
      _values.end.toString(),
    );
    return Center(
      child: RangeSlider(
        values: _values,
        labels: labels,
        divisions: 8,
        onChanged: (RangeValues newRanges) {
          setState(() {
            _values = newRanges;
          });
        },
      ),
    );
  }
}
