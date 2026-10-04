import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/screen/sliver_screen.dart';
import 'package:flutter_widget_gallery/widgets/adaptive_widget.dart';
import 'package:flutter_widget_gallery/widgets/catalog_section_title.dart';
import 'package:flutter_widget_gallery/widgets/choice_chip_widget.dart';
import 'package:flutter_widget_gallery/widgets/fitted_box_widget.dart';
import 'package:flutter_widget_gallery/widgets/hero_widget.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';
import 'package:flutter_widget_gallery/widgets/stream_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        "Widget Catalog Screen",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ],
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
            Text("With fitted box"),
            FittedBoxWidget(withFittedBox: true),
            CatalogSectionTitle(title: 'Adaptive widget'),
            AdaptiveWidget(),
            CatalogSectionTitle(title: "Hero Widget"),
            HeroWidget(),
            CatalogSectionTitle(title: "StreamBuilder Widget"),
            StreamBuilderWidget(),
            CatalogSectionTitle(title: "ChoiceChip Widget"),
            ChoiceChipWidget(),
            CatalogSectionTitle(title: "SLiver Widget"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SliverScreen()),
                );
              },
              child: Text("Go to Sliver Screen"),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomSearchDelegate extends SearchDelegate {
  final List<String> widgetNames = [
    'Stepper widget',
    'FittedBox widget',
    'ListView widget',
    'Container widget',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Top-right: a clear button, only shown if there's text
    // query = '' =>  clears the text field, retriggers buildSuggestions
    return [
      if (query.isNotEmpty)
        IconButton(onPressed: () => query = '', icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Shown after the user submits (presses enter/search)
    return Center(child: Text('Showing results for: "$query"'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = widgetNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        onTap: () {
          query = suggestions[index]; // fills the search field
          showResults(context); // manually trigger buildResults
        },
      ),
    );
  }
}
