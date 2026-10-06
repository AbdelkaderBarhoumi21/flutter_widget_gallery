import 'package:flutter/material.dart';

class TableRowWidget extends StatefulWidget {
  const TableRowWidget({super.key});

  @override
  State<TableRowWidget> createState() => _TableRowWidgetState();
}

class _TableRowWidgetState extends State<TableRowWidget> {
  final TableRow _tableRow = const TableRow(
    children: [
      Padding(padding: EdgeInsets.all(16.0), child: Text('Cell 1')),
      Padding(padding: EdgeInsets.all(16.0), child: Text('Cell 2')),
      Padding(padding: EdgeInsets.all(16.0), child: Text('Cell 3')),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultColumnWidth: const FixedColumnWidth(123.0),
      children: [
        _tableRow,
        _tableRow,
        _tableRow,
        _tableRow,
        _tableRow,
        _tableRow,  
      ],
    );
  }
}
