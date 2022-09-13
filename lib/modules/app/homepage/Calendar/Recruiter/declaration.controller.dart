import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/explorer_pharmacie.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
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
  PharmacyService pharmacyService = Get.find();
  SignInController signInController = Get.find();
  List<Pharmacy> _list = [];
  List<Pharmacy> get list => _list;

  List<Pharmacy> get list2 => _list
      .where((element) => element.ownerId == signInController.user.userId)
      .toList();
  // void incrementcard() {
  //   if (addCard.value >= 7) {
  //     return;
  //   }

  //   addCard.value++;
  // }

  @override
  void onInit() {
    super.onInit();
    debugPrint('ssss');
    ShowMyPhars();
  }

  navigateAjouter() {
    Get.toNamed(Routes.ajouterPharmacie);
  }

  navigateToHome() {
    Get.toNamed(Routes.homepagePhar);
  }

  ShowMyPhars() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await pharmacyService.getInfos();
      manageResponse(response);
    } on Error catch (e) {
      debugPrint('e: ${e.stackTrace}');
      HelperUtils.showSimpleSnackBar('Une erreur est survenue.');
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  manageResponse(var response) {
    debugPrint('response: $response');
    if (response.toString().contains("error")) {
      HelperUtils.showSimpleSnackBar(response['error']);
      change(null, status: RxStatus.success());
    } else {
      _list = (response as List).map((e) => Pharmacy.fromJson(e)).toList();
      change(null, status: RxStatus.success());
      update();
    }
  }
}
