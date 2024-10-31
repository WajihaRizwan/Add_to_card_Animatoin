import 'package:flutter/material.dart';

class AppListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final int index;
  final void Function(GlobalKey) onClick;

  AppListItem({super.key, required this.onClick, required this.index});

  List imagePathArray = ['assets/strawberry.png', 'assets/strawberry.png', 'assets/strawberry.png',
    'assets/strawberry.png', 'assets/strawberry.png', 'assets/strawberry.png', 'assets/strawberry.png',
    'assets/strawberry.png', 'assets/strawberry.png', 'assets/strawberry.png',];

  List titleArray = ['Men Boots', 'Converse Shoes', 'High Heels',
    'Running Shoes For Men', 'Jogging Shoes', 'Casual Shoes', 'Sneakers',
    'Red Sneakers', 'Pumps-High Heels', 'Black Sports Shoes',];

  @override
  Widget build(BuildContext context) {
    Widget mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.asset(
        imagePathArray[index],
        width: 60,
        height: 60,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      child: Card(
        color:  const Color.fromARGB(255, 187, 241, 189),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          onTap: () => onClick(widgetKey),
          leading: mandatoryContainer,
          title: Text(
            titleArray[index],
            style: const TextStyle(fontSize: 18.0, fontFamily: 'qa', fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}