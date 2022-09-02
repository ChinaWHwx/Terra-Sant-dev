import 'dart:convert';

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
  final errorMessage = "".obs;

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

  validateForm() {
    if (placeController.text.isEmpty ||
        name.text.isEmpty ||
        tel.text.isEmpty ||
        nameResponsable.text.isEmpty) {
      errorMessage.value = "Veuillez remplir tous les champs";
    } else if (!GetUtils.isNumericOnly(tel.text)) {
      errorMessage.value = 'Veuillez insérer des chiffres uniquement';
    } else if (!GetUtils.isLengthEqualTo(tel.text, 9)) {
      errorMessage.value = '9 chiffres requis';
    } else {
      navigateToMyRecruiter();
    }
  }

  checkEmpty(textEditinController) {
    return textEditingController.text.isEmpty;
  }

  navigateToMyRecruiter() {
    Get.toNamed(Routes.declaration);
  }
}
