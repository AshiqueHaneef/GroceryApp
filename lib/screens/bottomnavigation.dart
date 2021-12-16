import 'package:flutter/material.dart';
import 'package:grocery1/screens/screens/account.dart';
import 'package:grocery1/screens/screens/cart.dart';
import 'package:grocery1/screens/screens/explore.dart';
import 'package:grocery1/screens/screens/favourite.dart';

import 'home_screen.dart';

class bottomnavigation extends StatefulWidget {
  const bottomnavigation({Key? key}) : super(key: key);

  @override
  _bottomnavigationState createState() => _bottomnavigationState();
}

// ignore: camel_case_types
class _bottomnavigationState extends State<bottomnavigation> {
  int currentindex = 0;
  final screens = [
    const homeScreen(),
    const explore(),
    const cart(),
    const favourite(),
    const account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[200],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.white,
        currentIndex: currentindex,
        iconSize: 25,
        //showUnselectedLabels: false,
        onTap: (index) => setState(() => currentindex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_off_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
