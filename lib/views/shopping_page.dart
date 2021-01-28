import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Get.toNamed(
                '/userPage',
                arguments: ['User Page', Colors.grey[300]],
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '${controller.products[index].productDescription}',
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RaisedButton(
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    child: Text('Add'),
                                    onPressed: () {
                                      cartController.addToCart(
                                        controller.products[index],
                                      );
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.red,
                                    textColor: Colors.white,
                                    child: Text('Remove'),
                                    onPressed: () {
                                      cartController.removeToCart(
                                        controller.products[index],
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Add to favorites',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Obx(
                                    () => IconButton(
                                      icon: controller
                                              .products[index].isFavorite.value
                                          ? Icon(Icons.check_box_rounded)
                                          : Icon(Icons
                                              .check_box_outline_blank_outlined),
                                      onPressed: () {
                                        controller.products[index].isFavorite
                                            .toggle();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //getx
            // GetX<CartController>(
            //   builder: (controller) {
            //     return Text(
            //       'Total Amount: \$ ${controller.totalPrice}',
            //       style: TextStyle(
            //         fontSize: 32,
            //         color: Colors.white,
            //       ),
            //     );
            //   },
            // ),
            //getbuilder
            // GetBuilder<CartController>(
            //   builder: (controller) {
            //     return Text(
            //       'Total Amount: \$ ${controller.totalAmount}',
            //       style: TextStyle(
            //         fontSize: 32,
            //         color: Colors.white,
            //       ),
            //     );
            //   },
            // ),
            Obx(() {
              return Text(
                'Total Amount: \$ ${cartController.totalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              );
            }),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.blue,
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.countCart.toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            );
          },
        ),
        onPressed: () {
          // Get.snackbar(
          //   "SnackBar",
          //   "message",
          //   snackPosition: SnackPosition.TOP,
          //   duration: Duration(seconds: 4),
          //   colorText: Colors.white,
          //   backgroundColor: Colors.black,
          // );
        },
      ),
    );
  }
}
