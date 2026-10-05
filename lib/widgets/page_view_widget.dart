import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        _PageViewItem(label: "Page 1", color: Colors.red),
        _PageViewItem(label: "Page 2", color: Colors.blue),
        _PageViewItem(label: "Page 3", color: Colors.yellow),
      ],
    );
  }
}

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({required this.label, required this.color});
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(child: Text(label, style: TextStyle(fontSize: 32))),
    );
  }
}
