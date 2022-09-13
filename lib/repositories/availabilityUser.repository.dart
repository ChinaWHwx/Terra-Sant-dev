import 'package:get/get.dart';

class AvailabilityUserRepository extends GetConnect {
  @override
  void onInit() {
    //httpClient.defaultDecoder = Availability.availabilityFromJson;
    httpClient.baseUrl = 'http://51.178.83.92:5000';
  }

  Future addAvl(body) => post("/availability/add", body);
}
