import 'package:flutter/material.dart';

class _HeroItem {
  const _HeroItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String id;
  final String title;
  final IconData icon;
  final Color color;

  String get tag => 'Hero-$id';
}

const _items = [
  _HeroItem(
    id: 'fire',
    title: 'Fire',
    icon: Icons.local_fire_department,
    color: Colors.orange,
  ),
  _HeroItem(
    id: 'water',
    title: 'Water',
    icon: Icons.water_drop,
    color: Colors.blue,
  ),
  _HeroItem(
    id: 'nature',
    title: 'Nature',
    icon: Icons.eco,
    color: Colors.green,
  ),
];

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        for (final item in _items)
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HeroDetailScreen(item: item)),
              ),
              child: Hero(
                tag: item.tag,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.icon, color: Colors.white, size: 40),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({required this.item, super.key});

  final _HeroItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Hero(
              tag: item.tag,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(item.icon, color: Colors.white, size: 120),
              ),
            ),
            Text(item.title, style: Theme.of(context).textTheme.headlineMedium),
            const Text(
              'The card on the previous screen flew here: '
              'same tag, different size and position.',
            ),
          ],
        ),
      ),
    );
  }
}
