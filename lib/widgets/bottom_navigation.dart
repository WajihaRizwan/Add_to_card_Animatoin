import 'package:flutter/material.dart';
import 'package:getx/demo/demo_screen.dart';
import 'package:getx/favourite_screen.dart';
import 'package:getx/home%20screen.dart';
import 'package:getx/profile_screen.dart';

class BtmBar extends StatefulWidget {
  @override
  _BtmBarState createState() => _BtmBarState();
}

class _BtmBarState extends State<BtmBar> {
  int _currentIndex = 0; // Currently selected item index

  final List<Widget> _screens = [
    HomeScreen(), // Replace with your actual Favorites screen widget
    FavouriteScreen(), // Create a separate FavoritesScreen widget
    ProfileScreen(), // Create a separate ProfileScreen widget
    DemoScreen(), // Create a separate CartScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // ... Existing HomeScreen code (body and bottomNavigationBar)

    return Scaffold(
      // ...
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex, // Update with current index
        onTap: _onItemTapped,
      ),
      body: _screens[_currentIndex],
    );
  }
}