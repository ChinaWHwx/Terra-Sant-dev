import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/repositories/demande.repository.dart';
import 'package:flutter_application_1/repositories/pharmacy.repository.dart';
import 'package:get/get.dart';

class DemandeService {
  DemandeRepository demandeRepo = Get.find();

  Future getInfos(body) async {
    try {
      var response = await demandeRepo.getInfos(body);
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
