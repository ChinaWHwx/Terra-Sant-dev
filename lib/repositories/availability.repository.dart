import 'package:flutter_application_1/models/availability.model.dart';
import 'package:get/get.dart';

class AvailabilityRepository extends GetConnect {
  @override
  void onInit() {
    //httpClient.defaultDecoder = Availability.availabilityFromJson;
    httpClient.baseUrl = 'http://10.0.2.2';
  }

  Future addAvl(body) => post("/availability/add", body);
}
