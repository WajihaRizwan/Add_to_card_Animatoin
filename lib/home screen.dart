import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(margin: EdgeInsets.only(top: 20,left: 10,right: 10),
               child: TextField(
                         decoration: InputDecoration(
                           hintText: 'Search keywords...',
                           prefixIcon: Icon(Icons.search),
                           border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
                           ),
                           fillColor: Colors.grey[200],
                           filled: true,
                         ),
                       ),
             ),
            // Banner Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Delivery-Hero.jpg'), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
               
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [SizedBox(width: 20,),
                  CategoryIcon(icon: Icons.local_florist, label: 'Vegetables'), SizedBox(width: 20,),
                  CategoryIcon(icon: Icons.local_grocery_store, label: 'Fruits'),SizedBox(width: 20,),
                  CategoryIcon(icon: Icons.local_drink, label: 'Beverages'),SizedBox(width: 20,),
                  CategoryIcon(icon: Icons.local_grocery_store, label: 'Grocery'),SizedBox(width: 20,),
                   CategoryIcon(icon: Icons.local_restaurant, label: 'Restaurant'),SizedBox(width: 20,),
                  // Add more categories as needed
                ],
              ),
            ),
            // Featured Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Featured products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            
              children: [
                ProductCard(name: 'Fresh Peach', price: 8.0, imageUrl: 'assets/png-clipart-red-peach-fruit-juice-peach-fruit-crisp-food-peach-eating-superfood-thumbnail-removebg-preview.png'),
                ProductCard(name: 'Avocado', price: 7.0, imageUrl: 'assets/images__1_-removebg-preview.png'),
                 ProductCard(name: 'Fresh Orange', price: 8.0, imageUrl: 'assets/images__1_-removebg-preview.png'),
                ProductCard(name: 'StrawBerry', price: 7.0, imageUrl: 'assets/strawberry.png'), 
                ProductCard(name: 'Fresh Apple', price: 8.0, imageUrl: 'assets/images__5_-removebg-preview.png'),
                ProductCard(name: 'Mango', price: 7.0, imageUrl: 'assets/red_fruite-removebg-preview.png'), 
                 ProductCard(name: 'Fresh Peach', price: 8.0, imageUrl: 'assets/png-clipart-red-peach-fruit-juice-peach-fruit-crisp-food-peach-eating-superfood-thumbnail-removebg-preview.png'),
                ProductCard(name: 'Avocado', price: 7.0, imageUrl: 'assets/images__1_-removebg-preview.png'),
                // Add more products as needed
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Icon(icon, color: Colors.green),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;

  ProductCard({required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 216, 233, 216),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))),
                Center(child: Text('\$$price', style: TextStyle(color: Colors.green))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
