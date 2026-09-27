import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/widgets/catalog_section_title.dart';
import 'package:flutter_widget_gallery/widgets/fitted_box_widget.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Widget Catalog Screen"),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            CatalogSectionTitle(title: 'Stepper widget'),
            StepperWidget(),
            CatalogSectionTitle(title: 'FittedBox widget'),
            Text("Without fitted box"),
            FittedBoxWidget(withFittedBox: false),
            Text("Without fitted box"),
            FittedBoxWidget(withFittedBox: true),
          ],
        ),
      ),
    ),
  );
}
