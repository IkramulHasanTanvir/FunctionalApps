import 'package:coffee_shop/components/coffee_shop_bottom_nav_bar.dart';
import 'package:coffee_shop/screens/cart_screen.dart';
import 'package:coffee_shop/screens/shop_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ShopScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CoffeeShopBottomNavBar(
        onTapChange: (index) => _navigateBottomBar(index),
      ),
    );
  }

  void _navigateBottomBar(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
