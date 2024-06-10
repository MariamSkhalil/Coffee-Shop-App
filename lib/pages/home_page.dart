import 'package:flutter/material.dart';
import 'package:weatheapp/components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //navigate bottom bar
  int _selectedIndex=0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex= index;
    });
  }
  final List<Widget> _pages =[
    ShopPage(),
    CartPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index) ,
      ),
      body: _pages[_selectedIndex],
    );
  }
}