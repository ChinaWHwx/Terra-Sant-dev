import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:get/get.dart';

class DeclarationController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  var name = <TextEditingController>[];
  var tel = <TextEditingController>[];
  Rx<int> addCard = 1.obs;

  // void incrementcard() {
  //   if (addCard.value >= 7) {
  //     return;
  //   }

  //   addCard.value++;
  // }
  navigateAjouter() {
    Get.toNamed(Routes.ajouterPharmacie);
  }

  navigateToHome() {
    Get.toNamed(Routes.homepagePhar);
  }
}
