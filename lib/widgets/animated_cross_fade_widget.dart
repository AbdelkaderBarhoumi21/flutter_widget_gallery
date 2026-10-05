import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _isAnimated = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              _isAnimated = !_isAnimated;
            });
          },
          child: Text('Animate'),
        ),
        AnimatedCrossFade(
          firstChild: Text(
            'First Animated widget',
            style: TextStyle(fontSize: 60),
          ),
          secondChild: Text(
            'Second Animated widget',
            style: TextStyle(fontSize: 60),
          ),
          crossFadeState: _isAnimated
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
        ),
      ],
    );
  }
}
