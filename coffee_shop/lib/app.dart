import 'package:coffee_shop/home.dart';
import 'package:coffee_shop/widgets/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
