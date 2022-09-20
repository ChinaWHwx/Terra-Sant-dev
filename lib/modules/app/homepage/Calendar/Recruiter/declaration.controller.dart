import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/explorer_pharmacie.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/pharmacy.service.dart';
import 'package:flutter_application_1/shared/utils/helper.utils.dart';
import 'package:flutter_application_1/shared/widgets/methods/methods.shared.dart';
import 'package:get/get.dart';

class DeclarationController extends GetxController with StateMixin {
  final TextEditingController textEditingController = TextEditingController();
  var name = <TextEditingController>[];
  var tel = <TextEditingController>[];
  Rx<int> addCard = 1.obs;

  SignInController signInController = Get.find();
  HomepagePharController homepagePharController = Get.find();

  Future onRefresh() async {
    homepagePharController.onRefresh();
  }

  @override
  void onInit() {
    super.onInit();
    homepagePharController.ShowMyPhars();
  }

  navigateAjouter() {
    Get.toNamed(Routes.ajouterPharmacie);
  }

  navigateToHome() {
    Get.toNamed(Routes.homepagePhar);
  }
}
