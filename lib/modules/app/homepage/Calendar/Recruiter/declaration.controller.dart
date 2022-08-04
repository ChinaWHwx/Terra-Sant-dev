import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:get/get.dart';

class DeclarationController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  var name = <TextEditingController>[];
  var tel = <TextEditingController>[];
  Rx<int> addCard = 0.obs;
  Rx<int> reduceCard = 0.obs;

  judge() {
    printInfo(info: 'Ajoutez vos infos');
  }

  void incrementcard() {
    if (addCard.value >= 7) {
      return;
    }

    addCard.value++;
  }

  void decreasecard() {
    if (addCard.value < 1) {
      return;
    }

    addCard.value--;
  }

  navigateAjouter() {
    Get.toNamed(Routes.pharmacieInfo);
  }
}
