import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weatheapp/components/coffee_tile.dart';
import 'package:weatheapp/models/coffee.dart';
import 'package:weatheapp/models/coffee_shop.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeFromCart(coffee);
  }

  void pay(){
    //pay services
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text('Your cart', style: TextStyle(fontSize: 20,),),
            Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index){
              Coffee eachCoffee= value.userCart[index];
              return CoffeeTile(coffee: eachCoffee, onPressed:()=> removeFromCart(eachCoffee), icon: Icon(Icons.delete));

            }),
            ),

            GestureDetector(
              onTap: pay,
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15)
              
                ),
                child: const Text('PAY NOW', style: TextStyle(color: Colors.white,),),
              
              ),
            )
            
          ],
        ),
      ),
    )
   );
  }
}