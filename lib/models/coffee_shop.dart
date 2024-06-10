import 'package:flutter/material.dart';
import 'coffee.dart';
class CoffeeShop extends ChangeNotifier{
  //coffee for sale list
  final List<Coffee> _shop=[
    Coffee(name: 'Latte', price: '4.10', imagePath: 'lib/images/coffee-cup.png'),

    Coffee(name: 'Ice Coffee', price: '4.50', imagePath: 'lib/images/ice-coffee.png'),

    Coffee(name: 'Espresso', price: '3.10', imagePath: 'lib/images/hot-coffee.png'),
  ];

  //user cart
  List <Coffee> _userCart=[];

  //get coffee list
  List <Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}