import 'package:get/get.dart';

class MissionRecentRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.1.162:5000';
  }

  Future getInfos(body) => post("/mission/missionRecent", body);
}
