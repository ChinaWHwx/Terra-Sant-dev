import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/online_shopee/cart_controller.dart';
import 'package:flutter_application_1/modules/app/online_shopee/pharmacie_controller.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  final pharmacieController = Get.put(PharmacieController());
  final cartController = Get.put(CartController());

  FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les résultats"),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<PharmacieController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
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
                                        controller.products[index].productName,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(controller
                                          .products[index].productDescription),
                                    ],
                                  ),
                                  Text(controller.products[index].time,
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: const Text('Add to Cart'),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: const Text('les détailes'),
                              ),
                              Obx(() => IconButton(
                                    icon: controller
                                            .products[index].isFavorite.value
                                        ? const Icon(Icons.check_box_rounded)
                                        : const Icon(Icons
                                            .check_box_outline_blank_outlined),
                                    onPressed: () {
                                      controller.products[index].isFavorite
                                          .toggle();
                                    },
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            /*
            GetX<CartController>(builder: (controller) {
              return Text(
                //'Total amount: \$ ${controller.totalPrice}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            */
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
