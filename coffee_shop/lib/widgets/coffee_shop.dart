import 'package:coffee_shop/widgets//coffee.dart';
import 'package:flutter/cupertino.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee list
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
      name: 'Long Black',
      price: '120 tk',
      imagePath: 'assets/image/black.png',
    ),

    //latte
    Coffee(
      name: 'Latte',
      price: '160 tk',
      imagePath: 'assets/image/latte.png',
    ),

    //espresso
    Coffee(
      name: 'Espresso',
      price: '120 tk',
      imagePath: 'assets/image/espresso.png',
    ),

    //iced coffee
    Coffee(
      name: 'Iced Coffee',
      price: '220 tk',
      imagePath: 'assets/image/iced_coffee.png',
    ),
  ];

  //user cart
  final List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
