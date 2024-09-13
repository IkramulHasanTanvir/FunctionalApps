import 'package:coffee_shop/widgets/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({super.key, required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(coffee.imagePath),
      title: Text(coffee.name),
      subtitle: Text(coffee.price),
    );
  }
}
