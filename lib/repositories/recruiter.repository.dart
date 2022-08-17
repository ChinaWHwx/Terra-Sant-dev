import 'dart:convert';

import 'package:get/get.dart';

class RecruiterRepository extends GetConnect {
  @override
  void onInit() {
    //httpClient.defaultDecoder = User.userFromJson;
    //httpClient.defaultDecoder =
    httpClient.baseUrl = 'http://10.0.2.2';
  }

  Future getInfos(body) => post("/recruiter", body);
}
