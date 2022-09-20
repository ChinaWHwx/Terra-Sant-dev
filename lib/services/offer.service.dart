import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/repositories/offer.repository.dart';
import 'package:flutter_application_1/repositories/pharmacy.repository.dart';
import 'package:get/get.dart';

class OfferService {
  OfferRepository offerRepo = Get.find();

  Future getInfos() async {
    try {
      var response = await offerRepo.getInfos();
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
