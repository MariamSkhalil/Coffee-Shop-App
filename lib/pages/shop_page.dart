
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weatheapp/components/coffee_tile.dart';
import 'package:weatheapp/models/coffee.dart';
import 'package:weatheapp/models/coffee_shop.dart';
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addToCart(Coffee coffee){
    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    //notify success
    showDialog(
      context: context, 
      builder: (context) =>AlertDialog(title: Text('Added To Cart Successfully'),) );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context,value,child)=>SafeArea(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children:[
            const Text('How would you like your coffee?',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
            const SizedBox(height: 20,),
            //list of coffees
            Expanded(
              child: ListView.builder(
              itemCount: value.coffeeShop.length,
              itemBuilder: (context, index){
              Coffee eachCoffee= value.coffeeShop[index];

              return CoffeeTile(
                coffee: eachCoffee,
                onPressed: ()=> addToCart(eachCoffee),
                icon: Icon(Icons.add)
                );
            },
            ),
            )

           ]
        ),
      ),
    )
      );
  }
}