import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/catalog/catalog_example.dart';
import 'package:flutter_widget_gallery/screen/example_screen.dart';
import 'package:flutter_widget_gallery/widgets/catalog_example_tile.dart';
import 'package:flutter_widget_gallery/widgets/catalog_section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onToggleTheme});

  /// Switches the app between light and dark mode.
  final VoidCallback onToggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  /// `null` means every category is shown.
  CatalogCategory? _selectedCategory;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openExample(CatalogExample example) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ExampleScreen(example: example)),
    );
  }

  /// PopScope with canPop false prevents the user from exiting the app (the android back button is disabled)
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final sections = {
      for (final category in CatalogCategory.values)
        if (_selectedCategory == null || _selectedCategory == category)
          category: catalogExamples
              .where((e) => e.category == category && e.matches(_query))
              .toList(),
    }..removeWhere((_, examples) => examples.isEmpty);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: const Text('Widget Gallery'),
              actions: [
                IconButton(
                  tooltip: isDark ? 'Light mode' : 'Dark mode',
                  onPressed: widget.onToggleTheme,
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      '${catalogExamples.length} interactive Flutter widget '
                      'examples, ready to explore.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SearchBar(
                      controller: _searchController,
                      hintText: 'Search widgets',
                      elevation: const WidgetStatePropertyAll(0),
                      leading: const Icon(Icons.search),
                      trailing: [
                        if (_query.isNotEmpty)
                          IconButton(
                            tooltip: 'Clear',
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _query = '');
                            },
                            icon: const Icon(Icons.clear),
                          ),
                      ],
                      onChanged: (value) => setState(() => _query = value),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  spacing: 8,
                  children: [
                    ChoiceChip(
                      label: const Text('All'),
                      selected: _selectedCategory == null,
                      onSelected: (_) =>
                          setState(() => _selectedCategory = null),
                    ),
                    for (final category in CatalogCategory.values)
                      ChoiceChip(
                        avatar: Icon(
                          category.icon,
                          color: category.accent(context),
                        ),
                        label: Text(category.label),
                        selected: _selectedCategory == category,
                        onSelected: (selected) => setState(
                          () => _selectedCategory = selected ? category : null,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (sections.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 48,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      Text('No widget matches "$_query"'),
                    ],
                  ),
                ),
              ),
            for (final MapEntry(key: category, value: examples)
                in sections.entries) ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                sliver: SliverToBoxAdapter(
                  child: CatalogSectionTitle(
                    title: category.label,
                    icon: category.icon,
                    color: category.accent(context),
                    count: examples.length,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    mainAxisExtent: 144,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: examples.length,
                  itemBuilder: (context, index) => CatalogExampleTile(
                    example: examples[index],
                    onTap: () => _openExample(examples[index]),
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
