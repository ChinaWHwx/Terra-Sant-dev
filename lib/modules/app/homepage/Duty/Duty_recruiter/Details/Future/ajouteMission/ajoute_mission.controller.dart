import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/availabilityPhar.model.dart';
import 'package:flutter_application_1/models/duty.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/availabilityPhar.service.dart';
import 'package:get/get.dart';

class AjouterMissionController extends GetxController with StateMixin {
  final String details = 'Détails';
  ValueNotifier<List<Duty>> demoList = ValueNotifier(duties);
  Rx<String> errorMessage = "".obs;
  final TextEditingController dateEditingController = TextEditingController();
  late AvailabilityPhar availabilityPhar;
  // final TextEditingController tempsDebutEditingController =
  //     TextEditingController();

  // final TextEditingController tempsFinEditingController =
  //     TextEditingController();
  late final DateTime dateController;
  final homepagePharController = Get.find<HomepagePharController>();
  AvailabilityPharService availabilityPharService = Get.find();
  List<String> get dropdownText =>
      homepagePharController.listMyPhar.map((e) => e.phName ?? '').toList()
        ..add('null');

  List<String> dropdownTextForStatus = [
    'étudiant,e',
    'Préparateur,trice',
    'Pharmacien,ienne',
    'Autre'
  ];
  List<String> dropdownTextRepeate = [
    'quotidiennement',
    'hebdomadaire',
    'chaque mois',
    'chaque week-end',
    'Autre',
    'Ne pas répéter'
  ];

  List<String> dropdownTextPeriodeJournee = [
    'matin',
    'midi',
    'après-midi',
    'soir',
    'nuit',
    'toute la journée',
    'Autre'
  ];

  final selected = 'null'.obs;
  final selectedForStatus = "Autre".obs;
  final selectedRepeate = "Ne pas répéter".obs;
  final selectedPeriodeJournee = "toute la journée".obs;

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
    if (n == 3) {
      selectedPeriodeJournee.value = value;
    }
  }

  navigateToDuty() {
    Get.toNamed(Routes.dutyRecruiter);
  }

  navigateToHome() {
    Get.toNamed(Routes.recruAvailability);
  }

  navigateToDetailFuture() {
    Get.toNamed(Routes.recruAvailability);
  }

  validateForm() async {
    if (dateController.year == 0 || selected.value.toString() == 'null'
        // tempsDebutEditingController.text.isEmpty ||
        // tempsFinEditingController.text.isEmpty
        ) {
      errorMessage.value = "Champs obligatoire";
    } else {
      // List<int> PHid = homepagePharController.listMyPhar
      //     .map((e) => e.phId ?? 0)
      //     .where((element) => element.phname == selected.value);
      // availabilityPhar.ph_id = '已知药店名selected.value，这里要它在listMyPhar对应的药店的id';
      availabilityPhar.owner_id =
          homepagePharController.signInController.user.userId;
      availabilityPhar.repeat_phar = selectedRepeate.value;
      availabilityPhar.time_of_day_phar = selectedPeriodeJournee.value;
      availabilityPhar.date_month_year_phar = dateController.day.toString() +
          '/' +
          dateController.month.toString() +
          '/' +
          dateController.year.toString();
      //signUpService.newUser.userBirthdate = date as String?;
      var response = await availabilityPharService.addAvl(availabilityPhar);

      if (response.containsKey("success")) {
        if (response["success"] == 'true') {
          change(null, status: RxStatus.success());

          navigateToHome();
        }
      }
      if (response.containsKey('error')) {
        errorMessage.value = response["error"];
      }
    }
  }
}
