import 'package:flutter/material.dart';

class InteractiveViewerWidget extends StatefulWidget {
  const InteractiveViewerWidget({super.key});

  @override
  State<InteractiveViewerWidget> createState() =>
      _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        children: [
          InteractiveViewer(
            maxScale: 5,
            child: Image.asset('assets/image.jpg'),
          ),
          InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(double.infinity),
            child: Image.asset('assets/image.jpg'),
          ),
        ],
      ),
    );
  }
}
