import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favourite Screen",style: TextStyle(color: Colors.red,fontSize: 20),),
      ),
    );
  }
}