import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CoffeeShopBottomNavBar extends StatelessWidget {
  const CoffeeShopBottomNavBar({
    super.key,
    required this.onTapChange,
  });

  final void Function(int)? onTapChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: _buildNavButton(),
    );
  }

  Widget _buildNavButton() {
    return GNav(
      onTabChange: onTapChange,
      color: Colors.grey[400],
      mainAxisAlignment: MainAxisAlignment.center,
      activeColor: Colors.grey[700],
      tabBackgroundColor: Colors.grey.shade300,
      tabActiveBorder: Border.all(color: Colors.white),
      tabBorderRadius: 24,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: 'Cart',
        ),
      ],
    );
  }
}
