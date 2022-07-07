import 'package:get/state_manager.dart';
import 'package:flutter_application_1/models/product2.dart';

class PharmacieController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          time: '09:30--10:30',
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Pharmacie Auchan'),
      Product(
          id: 2,
          time: '10:30--11:30',
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Pharmacie Carrefour'),
      Product(
          id: 3,
          time: '11:30--12:30',
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'Pharmacie Casino'),
    ];

    products.value = productResult;
  }
}
