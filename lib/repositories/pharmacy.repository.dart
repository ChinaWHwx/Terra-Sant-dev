import 'dart:convert';

import 'package:get/get.dart';

class PharmacyRepository extends GetConnect {
  @override
  void onInit() {
    //httpClient.defaultDecoder = User.userFromJson;
    //httpClient.defaultDecoder =
    httpClient.baseUrl = 'http://51.178.83.92:5000';
  }

  Future getInfos() => get("/pharmacy");
  Future addPhar(body) => post("/pharmacy/add", body);
}
