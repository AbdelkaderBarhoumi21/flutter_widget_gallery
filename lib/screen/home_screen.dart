import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/screen/sliver_screen.dart';
import 'package:flutter_widget_gallery/widgets/adaptive_widget.dart';
import 'package:flutter_widget_gallery/widgets/animated_cross_fade_widget.dart';
import 'package:flutter_widget_gallery/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter_widget_gallery/widgets/catalog_section_title.dart';
import 'package:flutter_widget_gallery/widgets/choice_chip_widget.dart';
import 'package:flutter_widget_gallery/widgets/expanded_widget.dart';
import 'package:flutter_widget_gallery/widgets/expansion_tile_widget.dart';
import 'package:flutter_widget_gallery/widgets/fitted_box_widget.dart';
import 'package:flutter_widget_gallery/widgets/flexible_widget.dart';
import 'package:flutter_widget_gallery/widgets/future_builder_widget.dart';
import 'package:flutter_widget_gallery/widgets/grid_paper_widget.dart';
import 'package:flutter_widget_gallery/widgets/hero_widget.dart';
import 'package:flutter_widget_gallery/widgets/page_view_widget.dart';
import 'package:flutter_widget_gallery/widgets/range_slider_widget.dart';
import 'package:flutter_widget_gallery/widgets/show_date_picker_widget.dart';
import 'package:flutter_widget_gallery/widgets/show_time_picker_widget.dart';
import 'package:flutter_widget_gallery/widgets/spread_operator_widget.dart';
import 'package:flutter_widget_gallery/widgets/stack_widget.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';
import 'package:flutter_widget_gallery/widgets/stream_builder_widget.dart';
import 'package:flutter_widget_gallery/widgets/table_row_widget.dart';
import 'package:flutter_widget_gallery/widgets/tool_tip_widget.dart';
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

  /// Will pop scope is used to prevent the user from exist the app( the android back button is disabled) or going back to the previous screen
  Widget build(BuildContext context) => WillPopScope(
    child: Scaffold(
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
              CatalogSectionTitle(title: 'Bottom widget'),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Close',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text('Show bottom sheet'),
              ),

              CatalogSectionTitle(title: 'Cross fade widget'),
              AnimatedCrossFadeWidget(),
              CatalogSectionTitle(title: 'Expanded widget'),
              SizedBox(height: 200, child: ExpandedWidget()),
              CatalogSectionTitle(title: 'Flexible widget'),
              FlexibleWidget(),
              CatalogSectionTitle(title: 'Future builder widget'),
              FutureBuilderWidget(),
              CatalogSectionTitle(title: 'Grid paper widget'),
              GridPaperWidget(),
              CatalogSectionTitle(title: 'Tool tip widget'),
              ToolTipWidget(),
              CatalogSectionTitle(title: 'Spread operator widget'),
              SpreadOperatorWidget(),
              CatalogSectionTitle(title: 'Stack widget'),
              StackWidget(),
              CatalogSectionTitle(title: "App dialog widget"),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Alert dialog title'),
                      contentPadding: EdgeInsets.all(20),
                      content: const Text('This is the alert dialog'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Show dialog'),
              ),
              CatalogSectionTitle(title: 'Table row widget'),
              TableRowWidget()
            ],
          ),
        ),
      ),
    ),
    onWillPop: () async {
      return false;
    },
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
