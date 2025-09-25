// lib/features/browse/presentation/widgets/filter_pill.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterPill extends StatelessWidget {
  final String label;
  final IconData? leadingIcon; // ไอคอนซ้าย (เช่น ปุ่ม Filter)
  final bool hasChevron; // โชว์ลูกศรลงไหม
  final bool selected; // สถานะเลือก
  final VoidCallback? onTap;

  const FilterPill({
    super.key,
    required this.label,
    this.leadingIcon,
    this.hasChevron = true,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? Colors.black : const Color(0xFFF5F5F5);
    final fg = selected ? Colors.white : Colors.black;

    return SizedBox(
      height: 40,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: label.isEmpty ? 10 : 14,
              vertical: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label.isNotEmpty)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: fg,
                    ),
                  ),
                if (label.isNotEmpty && hasChevron) ...[
                  const SizedBox(width: 4),
                  Icon(CupertinoIcons.chevron_down, size: 14, color: fg),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
