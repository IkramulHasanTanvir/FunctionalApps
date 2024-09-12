import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 21),
              ),
              const SizedBox(height: 24),
              ListView.builder(itemBuilder: (context, index) {}),
            ],
          ),
        ),
      ),
    );
  }
}
