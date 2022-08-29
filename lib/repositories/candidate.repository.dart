import 'dart:convert';

import 'package:get/get.dart';

class CandidateRepository extends GetConnect {
  @override
  void onInit() {
    //httpClient.defaultDecoder = User.userFromJson;
    //httpClient.defaultDecoder =
    httpClient.baseUrl = 'http://192.168.1.161:5000';
  }

  Future getInfos(body) => post("/candidate", body);
}
