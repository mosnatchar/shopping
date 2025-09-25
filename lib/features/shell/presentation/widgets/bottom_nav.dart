import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as b;

class NavItem {
  final String label;
  final Widget icon;
  final int? badgeCount;

  const NavItem({required this.label, required this.icon, this.badgeCount});
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      NavItem(
        label: "Home",
        icon: Image.asset("assets/icons/home.png", width: 24, height: 24),
      ),
      NavItem(
        label: "Browse",
        icon: Image.asset("assets/icons/search.png", width: 24, height: 24),
      ),
      NavItem(
        label: "Favourites",
        icon: Image.asset("assets/icons/heart.png", width: 24, height: 24),
        badgeCount: 6,
      ),
      NavItem(
        label: "Cart",
        icon: Image.asset("assets/icons/cart.png", width: 24, height: 24),
        badgeCount: 2,
      ),
      NavItem(
        label: "Profile",
        icon: Image.asset("assets/icons/profile.png", width: 24, height: 24),
      ),
    ];

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black, // ใช้สำหรับ label
      unselectedItemColor: Colors.grey,

      selectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 10),

      items: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        final isSelected = index == currentIndex;
        final iconWidget = item.badgeCount != null && item.badgeCount! > 0
            ? b.Badge(
                position: b.BadgePosition.topEnd(top: -9, end: -12),
                badgeContent: Text(
                  "${item.badgeCount}",
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                badgeStyle: b.BadgeStyle(
                  badgeColor: isSelected ? Colors.black : Colors.grey, // ✅
                  padding: const EdgeInsets.all(5),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? Colors.black
                        : Colors.grey, // ✅ active/inactive
                    BlendMode.srcIn,
                  ),
                  child: item.icon,
                ),
              )
            : ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.black : Colors.grey, // ✅ active/inactive
                  BlendMode.srcIn,
                ),
                child: item.icon,
              );

        return BottomNavigationBarItem(icon: iconWidget, label: item.label);
      }).toList(),
    );
  }
}
