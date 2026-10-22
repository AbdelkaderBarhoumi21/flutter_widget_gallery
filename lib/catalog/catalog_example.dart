import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/screen/sliver_screen.dart';
import 'package:flutter_widget_gallery/widgets/adaptive_widget.dart';
import 'package:flutter_widget_gallery/widgets/alert_dialog_widget.dart';
import 'package:flutter_widget_gallery/widgets/animated_cross_fade_widget.dart';
import 'package:flutter_widget_gallery/widgets/aspect_ratio_widget.dart';
import 'package:flutter_widget_gallery/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter_widget_gallery/widgets/bottom_sheet_widget.dart';
import 'package:flutter_widget_gallery/widgets/checkbox_tile_widget.dart';
import 'package:flutter_widget_gallery/widgets/choice_chip_widget.dart';
import 'package:flutter_widget_gallery/widgets/expanded_widget.dart';
import 'package:flutter_widget_gallery/widgets/expansion_tile_widget.dart';
import 'package:flutter_widget_gallery/widgets/fitted_box_widget.dart';
import 'package:flutter_widget_gallery/widgets/flexible_widget.dart';
import 'package:flutter_widget_gallery/widgets/future_builder_widget.dart';
import 'package:flutter_widget_gallery/widgets/grid_paper_widget.dart';
import 'package:flutter_widget_gallery/widgets/hero_widget.dart';
import 'package:flutter_widget_gallery/widgets/interactive_viewer_widget.dart';
import 'package:flutter_widget_gallery/widgets/page_view_widget.dart';
import 'package:flutter_widget_gallery/widgets/range_slider_widget.dart';
import 'package:flutter_widget_gallery/widgets/selectable_text_widget.dart';
import 'package:flutter_widget_gallery/widgets/show_date_picker_widget.dart';
import 'package:flutter_widget_gallery/widgets/show_time_picker_widget.dart';
import 'package:flutter_widget_gallery/widgets/spread_operator_widget.dart';
import 'package:flutter_widget_gallery/widgets/stack_widget.dart';
import 'package:flutter_widget_gallery/widgets/stepper_widget.dart';
import 'package:flutter_widget_gallery/widgets/stream_builder_widget.dart';
import 'package:flutter_widget_gallery/widgets/table_row_widget.dart';
import 'package:flutter_widget_gallery/widgets/tool_tip_widget.dart';
import 'package:flutter_widget_gallery/widgets/visibility_widget.dart';

/// The sections the home screen groups the examples into.
enum CatalogCategory {
  layout('Layout', Icons.dashboard_outlined, Colors.indigo),
  input('Input & Selection', Icons.touch_app_outlined, Colors.teal),
  navigation('Navigation & Overlays', Icons.alt_route, Colors.deepOrange),
  display('Display & Motion', Icons.animation, Colors.pink),
  async('Async', Icons.sync, Colors.purple);

  const CatalogCategory(this.label, this.icon, this.swatch);
  final String label;
  final IconData icon;
  final MaterialColor swatch;

  /// Accent color with enough contrast for the current brightness.
  Color accent(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? swatch.shade300
      : swatch.shade600;
}

/// One entry of the gallery: its metadata and the demo it renders.
class CatalogExample {
  const CatalogExample({
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
    required this.source,
    required this.builder,
  });

  final String title;
  final String description;
  final IconData icon;
  final CatalogCategory category;

  /// File name of the example inside `lib/`.
  final String source;
  final WidgetBuilder builder;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    return q.isEmpty ||
        title.toLowerCase().contains(q) ||
        description.toLowerCase().contains(q);
  }
}

final List<CatalogExample> catalogExamples = [
  // Layout
  CatalogExample(
    title: 'Expanded',
    description: 'Children share the free space of a Column by flex factor.',
    icon: Icons.unfold_more,
    category: CatalogCategory.layout,
    source: 'widgets/expanded_widget.dart',
    builder: (_) => const SizedBox(height: 240, child: ExpandedWidget()),
  ),
  CatalogExample(
    title: 'Flexible',
    description: 'Like Expanded, but FlexFit.loose lets a child stay smaller.',
    icon: Icons.view_agenda_outlined,
    category: CatalogCategory.layout,
    source: 'widgets/flexible_widget.dart',
    builder: (_) => const FlexibleWidget(),
  ),
  CatalogExample(
    title: 'Stack',
    description: 'Overlapping children placed with Positioned offsets.',
    icon: Icons.layers_outlined,
    category: CatalogCategory.layout,
    source: 'widgets/stack_widget.dart',
    builder: (_) => const StackWidget(),
  ),
  CatalogExample(
    title: 'AspectRatio',
    description: 'Sizes a child to a fixed width-to-height ratio (16:9).',
    icon: Icons.aspect_ratio,
    category: CatalogCategory.layout,
    source: 'widgets/aspect_ratio_widget.dart',
    builder: (_) => const AspectRatioWidget(),
  ),
  CatalogExample(
    title: 'FittedBox',
    description: 'Large text with and without FittedBox scaling.',
    icon: Icons.fit_screen_outlined,
    category: CatalogCategory.layout,
    source: 'widgets/fitted_box_widget.dart',
    builder: (_) => const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text('Without FittedBox'),
        FittedBoxWidget(withFittedBox: false),
        Text('With FittedBox'),
        FittedBoxWidget(withFittedBox: true),
      ],
    ),
  ),
  CatalogExample(
    title: 'GridPaper',
    description: 'Draws a grid of lines, handy for layout debugging.',
    icon: Icons.grid_4x4,
    category: CatalogCategory.layout,
    source: 'widgets/grid_paper_widget.dart',
    builder: (_) => const GridPaperWidget(),
  ),
  CatalogExample(
    title: 'Table',
    description: 'Rows of cells with borders and fixed column widths.',
    icon: Icons.table_chart_outlined,
    category: CatalogCategory.layout,
    source: 'widgets/table_row_widget.dart',
    builder: (_) => const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: TableRowWidget(),
    ),
  ),
  CatalogExample(
    title: 'Spread operator',
    description: 'Inserting a list of widgets into children with "...".',
    icon: Icons.more_horiz,
    category: CatalogCategory.layout,
    source: 'widgets/spread_operator_widget.dart',
    builder: (_) => const SpreadOperatorWidget(),
  ),

  // Input & Selection
  CatalogExample(
    title: 'Stepper',
    description: 'Move between steps with continue, cancel and tap.',
    icon: Icons.linear_scale,
    category: CatalogCategory.input,
    source: 'widgets/stepper_widget.dart',
    builder: (_) => const StepperWidget(),
  ),
  CatalogExample(
    title: 'ChoiceChip',
    description: 'A single selectable chip with an avatar.',
    icon: Icons.label_outline,
    category: CatalogCategory.input,
    source: 'widgets/choice_chip_widget.dart',
    builder: (_) => const ChoiceChipWidget(),
  ),
  CatalogExample(
    title: 'RangeSlider',
    description: 'Pick a start and end value with labelled divisions.',
    icon: Icons.tune,
    category: CatalogCategory.input,
    source: 'widgets/range_slider_widget.dart',
    builder: (_) => const RangeSliderWidget(),
  ),
  CatalogExample(
    title: 'CheckboxListTile',
    description: 'A tristate checkbox combined with a list tile.',
    icon: Icons.check_box_outlined,
    category: CatalogCategory.input,
    source: 'widgets/checkbox_tile_widget.dart',
    builder: (_) => const CheckBoxTileWidget(),
  ),
  CatalogExample(
    title: 'Adaptive controls',
    description: 'Sliders, switches and indicators that adapt per platform.',
    icon: Icons.devices,
    category: CatalogCategory.input,
    source: 'widgets/adaptive_widget.dart',
    builder: (_) => const AdaptiveWidget(),
  ),
  CatalogExample(
    title: 'Date picker',
    description: 'Open showDatePicker and display the chosen date.',
    icon: Icons.calendar_month_outlined,
    category: CatalogCategory.input,
    source: 'widgets/show_date_picker_widget.dart',
    builder: (_) => const ShowDatePickerWidget(),
  ),
  CatalogExample(
    title: 'Time picker',
    description: 'Open showTimePicker and display the chosen time.',
    icon: Icons.schedule,
    category: CatalogCategory.input,
    source: 'widgets/show_time_picker_widget.dart',
    builder: (_) => const ShowTimePickerWidget(),
  ),

  // Navigation & Overlays
  CatalogExample(
    title: 'Hero',
    description: 'Cards that fly to a detail screen during navigation.',
    icon: Icons.flight_takeoff,
    category: CatalogCategory.navigation,
    source: 'widgets/hero_widget.dart',
    builder: (_) => const HeroWidget(),
  ),
  CatalogExample(
    title: 'Slivers',
    description: 'A collapsing app bar with a sliver grid and list.',
    icon: Icons.view_day_outlined,
    category: CatalogCategory.navigation,
    source: 'screen/sliver_screen.dart',
    builder: (context) => FilledButton.icon(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SliverScreen()),
      ),
      icon: const Icon(Icons.open_in_new),
      label: const Text('Open sliver screen'),
    ),
  ),
  CatalogExample(
    title: 'PageView',
    description: 'Swipe horizontally between full-size pages.',
    icon: Icons.swipe,
    category: CatalogCategory.navigation,
    source: 'widgets/page_view_widget.dart',
    builder: (_) => const SizedBox(height: 200, child: PageViewWidget()),
  ),
  CatalogExample(
    title: 'BottomNavigationBar',
    description: 'Switch the selected destination of a bottom bar.',
    icon: Icons.space_dashboard_outlined,
    category: CatalogCategory.navigation,
    source: 'widgets/bottom_navigation_bar_widget.dart',
    builder: (_) => const BottomNavigationBarWidget(),
  ),
  CatalogExample(
    title: 'Bottom sheet',
    description: 'A modal sheet that slides up from the bottom.',
    icon: Icons.vertical_align_top,
    category: CatalogCategory.navigation,
    source: 'widgets/bottom_sheet_widget.dart',
    builder: (_) => const BottomSheetWidget(),
  ),
  CatalogExample(
    title: 'AlertDialog',
    description: 'A modal dialog with a title, content and actions.',
    icon: Icons.chat_bubble_outline,
    category: CatalogCategory.navigation,
    source: 'widgets/alert_dialog_widget.dart',
    builder: (_) => const AlertDialogWidget(),
  ),
  CatalogExample(
    title: 'Tooltip',
    description: 'Long-press or hover an icon to reveal a label.',
    icon: Icons.info_outline,
    category: CatalogCategory.navigation,
    source: 'widgets/tool_tip_widget.dart',
    builder: (_) => const ToolTipWidget(),
  ),

  // Display & Motion
  CatalogExample(
    title: 'AnimatedCrossFade',
    description: 'Fade between two children when the state changes.',
    icon: Icons.compare_arrows,
    category: CatalogCategory.display,
    source: 'widgets/animated_cross_fade_widget.dart',
    builder: (_) => const AnimatedCrossFadeWidget(),
  ),
  CatalogExample(
    title: 'Visibility',
    description: 'Show or hide a child without removing it from the code.',
    icon: Icons.visibility_outlined,
    category: CatalogCategory.display,
    source: 'widgets/visibility_widget.dart',
    builder: (_) => const VisibilityWidget(),
  ),
  CatalogExample(
    title: 'ExpansionTile',
    description: 'A list tile that expands to reveal more items.',
    icon: Icons.expand_circle_down_outlined,
    category: CatalogCategory.display,
    source: 'widgets/expansion_tile_widget.dart',
    builder: (_) => const ExpansionTileWidget(),
  ),
  CatalogExample(
    title: 'InteractiveViewer',
    description: 'Pan and pinch-to-zoom an image.',
    icon: Icons.zoom_in,
    category: CatalogCategory.display,
    source: 'widgets/interactive_viewer_widget.dart',
    builder: (_) => const InteractiveViewerWidget(),
  ),
  CatalogExample(
    title: 'SelectableText',
    description: 'Text the user can select, with live selection output.',
    icon: Icons.text_fields,
    category: CatalogCategory.display,
    source: 'widgets/selectable_text_widget.dart',
    builder: (_) => const SelectableTextWidget(),
  ),

  // Async
  CatalogExample(
    title: 'FutureBuilder',
    description: 'Loading and error states of a one-shot Future.',
    icon: Icons.hourglass_bottom,
    category: CatalogCategory.async,
    source: 'widgets/future_builder_widget.dart',
    builder: (_) => const FutureBuilderWidget(),
  ),
  CatalogExample(
    title: 'StreamBuilder',
    description: 'Loading, streamed values, completion and errors.',
    icon: Icons.stream,
    category: CatalogCategory.async,
    source: 'widgets/stream_builder_widget.dart',
    builder: (_) => const StreamBuilderWidget(),
  ),
];
