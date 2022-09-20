import 'dart:convert';
import 'package:flutter_application_1/models/availabilityPhar.model.dart';
import 'package:flutter_application_1/models/explorer_pharmacie.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/services/login.service.dart';
import 'package:flutter_application_1/services/pharmacy.service.dart';
import 'package:flutter_application_1/services/recruiter.service.dart';
import 'package:flutter_application_1/services/signUp.service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'package:http/http.dart' as http;

class EditAVLPController extends GetxController with StateMixin<List<dynamic>> {
  final String details = 'Détails';
  Rx<String> errorMessage = "".obs;
  final TextEditingController dateEditingController = TextEditingController();

  final TextEditingController tempsDebutEditingController =
      TextEditingController();

  final TextEditingController tempsFinEditingController =
      TextEditingController();
  late String? oldStatus;
  late int? oldPharID;
  final homepagePharController = Get.find<HomepagePharController>();
  final signInController = Get.find<SignInController>();
//这里获取上一个页面传来的数据
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
    final availabilityPhars = Get.arguments as AvailabilityPhar;
    oldPharID = availabilityPhars.ph_id;
    oldStatus = availabilityPhars.date_month_year_phar;
  }

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
    'chaque jour',
    'chaque semaine',
    'chaque moi',
    'chaque année',
    'Ne pas répéter'
  ];

  final selected = 'null'.obs;
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
