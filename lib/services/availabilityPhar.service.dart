import 'package:flutter_application_1/repositories/availabilityPhar.repository.dart';
import 'package:flutter_application_1/repositories/availabilityUser.repository.dart';
import 'package:get/get.dart';

class AvailabilityPharService {
  AvailabilityPharRepository availabilityPharRepo = Get.find();

  Future addAvl(body) async {
    try {
      var response = await availabilityPharRepo.addAvl(body);
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
