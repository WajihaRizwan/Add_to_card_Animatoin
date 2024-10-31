import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/demo/my_detail_screen.dart';
import 'package:getx/democontroler/demo_controller.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  DemoScreenState createState() => DemoScreenState();
}

class DemoScreenState extends State<DemoScreen> {
  CartController cartController = Get.put(CartController());
  // We can detect the location of the cart by this  GlobalKey<CartIconKey>

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      cartKey: cartController.cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        cartController.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 57, 119, 59),
          
        ),
        body: GetBuilder<CartController>(builder: (getContext) {
          return Column(
            children: [
              SizedBox(
                height: 650,
                child: ListView(
                  children: List.generate(10, (index) {
                    return AppListItem(
                      onClick: listClick,
                      index: index,
                    );
                  }),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 108, 255, 157)),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    const Text("Add to Cart"),
                    AddToCartIcon(
                      key: cartController.cartKey,
                      icon: const Icon(Icons.shopping_cart),
                      badgeOptions: const BadgeOptions(
                        active: true,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    SizedBox(width: 70,),
                    GestureDetector(
                      onTap: () {
                cartController.showDialogBox(context);
              },
              child: Icon(Icons.cleaning_services_sharp),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await cartController.runAddToCartAnimation(widgetKey);
    await cartController.cartKey.currentState!
        .runCartAnimation((++cartController.cartQuantityItems).toString());
  }
}
