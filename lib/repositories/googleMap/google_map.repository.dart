import 'package:get/get.dart';

class GoogleMapRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.1.161:5000';
  }

  Future getInfos(body) => post("/google_Map", body);
}
