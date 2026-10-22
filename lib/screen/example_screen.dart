import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/catalog/catalog_example.dart';

/// Shows a single example: what it demonstrates and the live demo.
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key, required this.example});
  final CatalogExample example;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = example.category.accent(context);
    return Scaffold(
      appBar: AppBar(title: Text(example.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  avatar: Icon(example.category.icon, color: color, size: 18),
                  label: Text(example.category.label),
                  side: BorderSide.none,
                  backgroundColor: color.withValues(alpha: 0.12),
                ),
                Chip(
                  avatar: const Icon(Icons.code, size: 18),
                  label: Text('lib/${example.source}'),
                  side: BorderSide.none,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                ),
              ],
            ),
            Text(example.description, style: theme.textTheme.bodyLarge),
            Text(
              'LIVE DEMO',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
            Card.outlined(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(child: example.builder(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
