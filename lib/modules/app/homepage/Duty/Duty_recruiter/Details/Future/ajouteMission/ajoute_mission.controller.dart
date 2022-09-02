import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/duty.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:get/get.dart';

class AjouterMissionController extends GetxController {
  final String details = 'Détails';
  ValueNotifier<List<Duty>> demoList = ValueNotifier(duties);
  Rx<String> errorMessage = "".obs;
  final TextEditingController dateEditingController = TextEditingController();

  final TextEditingController tempsDebutEditingController =
      TextEditingController();

  final TextEditingController tempsFinEditingController =
      TextEditingController();
  List<String> dropdownText = demoPharmacies.map((x) => x.phName).toList();
  List<String> dropdownTextForStatus = [
    'étudiant,e',
    'Préparateur,trice',
    'Pharmacien,ienne',
    'Autre'
  ];
  List<String> dropdownTextRepeate = [
    'chaque jour',
    'chaque semaine',
    'chaque moi',
    'chaque année',
    'Ne pas répéter'
  ];

  final selected = "Pharma".obs;
  final selectedForStatus = "Autre".obs;
  final selectedRepeate = "Ne pas répéter".obs;

  void setSelected(n, value) {
    if (n == 0) {
      selected.value = value;
    }
    if (n == 1) {
      selectedForStatus.value = value;
    }
    if (n == 2) {
      selectedRepeate.value = value;
    }
  }

  navigateToDuty() {
    Get.toNamed(Routes.dutyRecruiter);
  }

  navigateToHome() {
    Get.toNamed(Routes.homepagePhar);
  }

  navigateToDetailFuture() {
    Get.toNamed(Routes.recruAvailability);
  }

  validateForm() {
    if (dateEditingController.text.isEmpty ||
        tempsDebutEditingController.text.isEmpty ||
        tempsFinEditingController.text.isEmpty) {
      errorMessage.value = "Champs obligatoire";
    } else {
      errorMessage.value = "";
      navigateToDetailFuture();
    }
  }
}
