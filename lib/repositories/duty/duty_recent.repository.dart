import 'package:get/get.dart';

class DutyRecentRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2';
  }

  Future getInfos(body) => post("/mission/missionRecent", body);
}
