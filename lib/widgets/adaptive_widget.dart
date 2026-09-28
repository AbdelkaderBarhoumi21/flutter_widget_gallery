import 'package:flutter/material.dart';

class AdaptiveWidget extends StatefulWidget {
  const AdaptiveWidget({super.key});

  @override
  State<AdaptiveWidget> createState() => _AdaptiveWidgetState();
}

class _AdaptiveWidgetState extends State<AdaptiveWidget> {
  double _currentSliderValue = 0;
  bool _currentSwitchListTile = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.withValues(alpha: 0.2),
      ),
      child: Column(
        spacing: 16,
        children: [
          Text("Slider adaptive"),
          Slider.adaptive(
            value: _currentSliderValue,
            onChanged: (double newValue) {
              setState(() {
                _currentSliderValue = newValue;
              });
            },
          ),
          SwitchListTile.adaptive(
            value: _currentSwitchListTile,
            onChanged: (bool newValue) {
              setState(() {
                _currentSwitchListTile = newValue;
              });
            },
          ),
          Switch.adaptive(value: true, onChanged: (bool newValue) {}),
          Icon(Icons.adaptive.share),
          const CircularProgressIndicator.adaptive(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
