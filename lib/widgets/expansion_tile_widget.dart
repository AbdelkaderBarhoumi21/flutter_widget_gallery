import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({super.key});

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("See more"),
      leading: Icon(Icons.expand_more),
      backgroundColor: Colors.blue,
      children: [
        ListTile(
          title: Text("Item 1"),
          onTap: () {
            // Handle item tap
          },
        ),
        ListTile(
          title: Text("Item 2"),
          onTap: () {
            // Handle item tap
          },
        ),
        ListTile(
          title: Text("Item 3"),
          onTap: () {
            // Handle item tap
          },
        ),
      ],
    );
  }
}
