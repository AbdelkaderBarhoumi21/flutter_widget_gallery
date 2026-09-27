import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/widgets/catalog_section_title.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Widget Catalog Screen")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CatalogSectionTitle(title: 'Stepper widget'),
          SizedBox(height: 16),
          StepperWidget(),
          SizedBox(height: 16),
          CatalogSectionTitle(title: 'FittedBox widget'),
        ],
      ),
    ),
  );
}
