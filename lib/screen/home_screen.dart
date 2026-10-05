import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/screen/sliver_screen.dart';
import 'package:flutter_widget_gallery/widgets/adaptive_widget.dart';
import 'package:flutter_widget_gallery/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter_widget_gallery/widgets/catalog_section_title.dart';
import 'package:flutter_widget_gallery/widgets/choice_chip_widget.dart';
import 'package:flutter_widget_gallery/widgets/expansion_tile_widget.dart';
import 'package:flutter_widget_gallery/widgets/fitted_box_widget.dart';
import 'package:flutter_widget_gallery/widgets/hero_widget.dart';
import 'package:flutter_widget_gallery/widgets/page_view_widget.dart';
import 'package:flutter_widget_gallery/widgets/range_slider_widget.dart';
import 'package:flutter_widget_gallery/widgets/show_date_picker_widget.dart';
import 'package:flutter_widget_gallery/widgets/show_time_picker_widget.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';
import 'package:flutter_widget_gallery/widgets/stream_builder_widget.dart';
import 'package:flutter_widget_gallery/widgets/visibility_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "Widget Catalog Screen";
  String appBarTitle = "Widget Catalog Screen 2";
  String apBarSecondTitle = "Widget Catalog Screen 3";

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(value: appBarTitle, child: Text(appBarTitle)),
            PopupMenuItem(
              value: apBarSecondTitle,
              child: Text(apBarSecondTitle),
            ),
          ],
          onSelected: (String newValue) {
            setState(() {
              title = newValue;
            });
          },
        ),
      ],
    ),
    bottomNavigationBar: BottomNavigationBarWidget(),
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
            CatalogSectionTitle(title: "Expansion tile widget"),
            ExpansionTileWidget(),
            CatalogSectionTitle(title: "Show Time Picker widget"),
            ShowTimePickerWidget(),
            CatalogSectionTitle(title: 'Show Date Picker widget'),
            ShowDatePickerWidget(),
            CatalogSectionTitle(title: 'Range slider widget'),
            RangeSliderWidget(),
            CatalogSectionTitle(title: 'Visibility  widget'),
            VisibilityWidget(),
            CatalogSectionTitle(title: 'Page view widget'),
            SizedBox(height: 200, child: PageViewWidget()),
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
