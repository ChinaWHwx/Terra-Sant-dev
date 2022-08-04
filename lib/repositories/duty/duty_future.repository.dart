import 'package:get/get.dart';

class DutyFutureRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2';
  }

  Future getInfos(body) => post("/mission/missionFuture", body);
}
