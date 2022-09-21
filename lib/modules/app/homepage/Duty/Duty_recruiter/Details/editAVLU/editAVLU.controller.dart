import 'dart:convert';
import 'package:flutter_application_1/models/availabilityPhar.model.dart';
import 'package:flutter_application_1/models/availabilityUser.model.dart';
import 'package:flutter_application_1/models/explorer_pharmacie.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';
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

class EditAVLUController extends GetxController with StateMixin<List<dynamic>> {
  final String details = 'Détails';
  Rx<String> errorMessage = "".obs;
  final TextEditingController dateEditingController = TextEditingController();

  final TextEditingController tempsDebutEditingController =
      TextEditingController();

  final TextEditingController tempsFinEditingController =
      TextEditingController();
  late String? oldStatus;
  late int? oldPharID;
  final homepageController = Get.find<HomepageController>();
  final signInController = Get.find<SignInController>();
//这里获取上一个页面传来的数据
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }
}
