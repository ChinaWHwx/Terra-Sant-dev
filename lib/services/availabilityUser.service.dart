import 'package:flutter_application_1/repositories/availabilityUser.repository.dart';
import 'package:get/get.dart';

class AvailabilityUserService {
  AvailabilityUserRepository availabilityUserRepo = Get.find();

  Future addAvl(body) async {
    try {
      var response = await availabilityUserRepo.addAvl(body);
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
