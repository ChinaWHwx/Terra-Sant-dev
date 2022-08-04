import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/repositories/signUp.repository.dart';
import 'package:get/get.dart';

class SignUpService {
  SignUpRepository signUpRepo = Get.find();
  var newUser = User();

  Future createUser() async {
    try {
      var response = await signUpRepo.createUser(newUser.toJson());
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future addEmailUser() async {
    try {
      var response = await signUpRepo.addEmailUser(newUser.toJson());
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future addAddressUser() async {
    try {
      var response = await signUpRepo.addAddressUser(newUser.toJson());
      return response.body;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
