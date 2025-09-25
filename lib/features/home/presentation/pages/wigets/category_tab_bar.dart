/// lib/features/home/presentation/widgets/category_tab_bar.dart
import 'package:flutter/material.dart';

class CategoryTabBar extends StatefulWidget {
  final List<String> items;
  final int initialIndex;
  final ValueChanged<int>? onChanged;
  final EdgeInsets padding;

  const CategoryTabBar({
    super.key,
    required this.items,
    this.initialIndex = 0,
    this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  late int _index;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  void _select(int i) {
    if (_index == i) return;
    setState(() => _index = i);
    widget.onChanged?.call(i);
    // เลื่อนให้เห็น tab ที่เลือก
    _controller.animateTo(
      (i * 50).toDouble(),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
    final unselectedStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey.shade500,
      fontWeight: FontWeight.w500,
    );

    return SizedBox(
      height: 44, // ความสูงรวมของแถว
      child: ListView.separated(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        padding: widget.padding,
        itemCount: widget.items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 24),
        itemBuilder: (context, i) {
          final selected = i == _index;

          return InkWell(
            onTap: () => _select(i),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6), // เว้นที่ให้เส้นใต้
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.items[i],
                    style: selected ? selectedStyle : unselectedStyle,
                  ),
                  const SizedBox(height: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    height: 3,
                    width: selected ? 22 : 0, // เส้นใต้เฉพาะ tab ที่เลือก
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
