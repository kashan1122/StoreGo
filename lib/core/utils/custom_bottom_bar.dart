import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [

          /// Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 78,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 20,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  _item(
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home_outlined,
                    label: "Home",
                    index: 0,
                  ),

                  _item(
                    icon: Icons.favorite_border,
                    activeIcon: Icons.favorite_border,
                    label: "Wishlist",
                    index: 1,
                  ),

                  const SizedBox(width: 50),

                  _item(
                    icon: Icons.search,
                    activeIcon: Icons.search,
                    label: "Search",
                    index: 3,
                  ),

                  _item(
                    icon: Icons.settings_outlined,
                    activeIcon: Icons.settings_outlined,
                    label: "Setting",
                    index: 4,
                  ),
                ],
              ),
            ),
          ),

          /// Floating Cart Button
          Positioned(
            top: 8,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                  color: currentIndex == 2
                      ? Colors.red
                      : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final bool selected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? activeIcon : icon,
              size: 20,
              color: selected ? Colors.red : Colors.black,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight:
                selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}