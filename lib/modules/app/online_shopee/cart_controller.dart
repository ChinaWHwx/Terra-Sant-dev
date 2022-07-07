import 'package:get/state_manager.dart';
import 'package:flutter_application_1/models/product2.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  // double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.time);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
