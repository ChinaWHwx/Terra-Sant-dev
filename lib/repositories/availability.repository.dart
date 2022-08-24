import 'package:get/get.dart';

class AvailabilityRepository extends GetConnect {
  @override
  void onInit() {
    //httpClient.defaultDecoder = Availability.availabilityFromJson;
    httpClient.baseUrl = 'http://192.168.1.162:5000';
  }

  Future addAvl(body) => post("/availability/add", body);
}
