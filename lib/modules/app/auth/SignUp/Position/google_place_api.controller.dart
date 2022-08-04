import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/signUp.service.dart';
import 'package:flutter_application_1/shared/widgets/methods/methods.shared.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GooglePlaceApiController extends GetxController
    with StateMixin<List<dynamic>> {
  SignUpService signUpService = Get.find();
  // ignore: non_constant_identifier_names
  String KPLACES_API_KEY = "AIzaSyD4U3Q0x6MR0ad-UXTwp6XVvaBsmlHkOhc";
  String baseURL =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  TextEditingController controller = TextEditingController();
  var uuid = const Uuid();
  String? sessionToken;
  List<dynamic> placesList = [];

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
    controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    sessionToken ??= uuid.v4();
    if (controller.text.isNotEmpty) {
      getSuggesion(controller.text);
    }
  }

  navigateToInfos() {
    Get.toNamed(Routes.infoRoute);
  }

  saveAddress() async {
    if (controller.text.isEmpty) {
      showToast('Veuillez remplir le champs.');
    } else if (!GetUtils.isEmail(controller.text)) {
      showToast('Cette adresse est invalide !');
    } else {
      signUpService.newUser.userAddress = controller.text;
      var response = await signUpService.addAddressUser();
      if (response.containsKey("success")) {
        if (response["success"] == 'true') {
          change(null, status: RxStatus.success());
          navigateToInfos();
        }
      }
      if (response.containsKey('error')) {
        signUpService.newUser.userAddress = '';
        showToast(response["error"]);
      }
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
}
