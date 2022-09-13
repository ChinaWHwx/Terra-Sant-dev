import 'dart:convert';
import 'package:flutter_application_1/models/explorer_pharmacie.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/services/login.service.dart';
import 'package:flutter_application_1/services/pharmacy.service.dart';
import 'package:flutter_application_1/services/recruiter.service.dart';
import 'package:flutter_application_1/services/signUp.service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'package:http/http.dart' as http;

class AjouterPharmacieController extends GetxController
    with StateMixin<List<dynamic>> {
  final TextEditingController textEditingController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  String KPLACES_API_KEY = "AIzaSyD4U3Q0x6MR0ad-UXTwp6XVvaBsmlHkOhc";
  String baseURL =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  var uuid = const Uuid();
  String? sessionToken;
  List<dynamic> placesList = [];
  var name = TextEditingController();
  var tel = TextEditingController();
  var nameResponsable = TextEditingController();
  var codePostal = TextEditingController();
  final errorMessage = "".obs;
  LoginService loginService = Get.find();
  SignInController signInController = Get.find();
  PharmacyService pharmacyService = Get.find();

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
    placeController.addListener(() {
      onChange();
    });
  }

  void onChange() {
    sessionToken ??= uuid.v4();
    if (placeController.text.isNotEmpty) {
      getSuggesion(placeController.text);
    }
  }

  void getSuggesion(String input) async {
    change(null, status: RxStatus.loading());
    String request =
        '$baseURL?input=$input&key=$KPLACES_API_KEY&sessiontoken=$sessionToken';

    var response = await http.get(Uri.parse(request));
    // ignore: unused_local_variable
    var data = response.body.toString();

    // print(data);
    //print(response.body.toString());

    if (response.statusCode == 200) {
      placesList = jsonDecode(response.body.toString())['predictions'];
      change(placesList, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error('Failed to load data'));
    }
  }

  validateForm() async {
    if (placeController.text.isEmpty ||
        name.text.isEmpty ||
        tel.text.isEmpty ||
        nameResponsable.text.isEmpty ||
        codePostal.text.isEmpty) {
      errorMessage.value = "Veuillez remplir tous les champs";
    } else if (!GetUtils.isNumericOnly(tel.text)) {
      errorMessage.value = 'Veuillez insérer des chiffres uniquement';
    } else if (!GetUtils.isLengthEqualTo(tel.text, 9)) {
      errorMessage.value = '9 chiffres requis';
    } else {
      // pharmacyService.pharmacy.phName = name.text;
      // pharmacyService.pharmacy.phAddress = placeController.text;
      // pharmacyService.pharmacy.phPhone = tel.text;
      // pharmacyService.pharmacy.ph_region = codePostal.text;
      // pharmacyService.pharmacy.ownerId = signInController.user.userId;
      // var response = await pharmacyService.addPhar();
      // if (response.containsKey("success")) {
      //   if (response["success"] == 'true') {
      //     change(null, status: RxStatus.success());
      //     navigateToMyRecruiter();
      //   }
      // }
      // if (response.containsKey('error')) {
      //   errorMessage.value = response["error"];
      // }
    }
  }

  checkEmpty(textEditinController) {
    return textEditingController.text.isEmpty;
  }

  navigateToMyRecruiter() {
    Get.toNamed(Routes.declaration);
  }
}
