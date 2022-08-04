import 'package:get/get.dart';

class DutyNowRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2';
  }

  Future getInfos(body) => post("/mission/missionNow", body);
}
