import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeclarationController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  var name = <TextEditingController>[];
  var tel = <TextEditingController>[];
  Rx<int> addCard = 0.obs;

  void incrementcard() {
    if (addCard.value >= 7) {
      return;
    }

    addCard.value++;
  }
}
