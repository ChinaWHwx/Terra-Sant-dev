import 'package:flutter_application_1/repositories/availability.repository.dart';
import 'package:get/get.dart';

class AvailabilityService {
  AvailabilityRepository availabilityRepo = Get.find();

  Future addAvl(body) async {
    try {
      var response = await availabilityRepo.addAvl(body);
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
