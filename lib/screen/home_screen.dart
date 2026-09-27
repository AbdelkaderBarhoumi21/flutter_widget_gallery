import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Widget Catalog Screen")),
    body: ListView(children: [StepperWidget()]),
  );
}
