// lib/features/browse/presentation/widgets/filter_pills_row.dart
import 'package:flutter/material.dart';
import 'filter_pill.dart';

class FilterPillsRow extends StatelessWidget {
  final EdgeInsets padding;
  final List<Widget> children;

  const FilterPillsRow({
    super.key,
    this.padding = const EdgeInsets.all(16),
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}
