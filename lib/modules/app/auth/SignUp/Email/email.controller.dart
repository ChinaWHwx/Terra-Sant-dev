import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/modules/app/auth/auth.controller.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/signUp.service.dart';
import 'package:get/get.dart';

class EmailController extends GetxController with StateMixin {
  SignUpService signUpService = Get.find();
  final TextEditingController textEditingController = TextEditingController();
  final errorMessage = "".obs;
  AuthController authController = Get.find();
  navigateToAuth() {
    Get.toNamed(Routes.auth);
  }

  navigateToEmailVerification() {
    Get.toNamed(Routes.emailVerificationRoute);
  }

  navigateToPosition() {
    Get.toNamed(Routes.googleplaceapiRoute);
  }

  validateForm(n) async {
    if (textEditingController.text.isEmpty) {
      errorMessage.value = 'Veuillez remplir le champs.';
    } else if (!GetUtils.isEmail(textEditingController.text)) {
      errorMessage.value = 'Cette adresse est invalide !';
    } else {
      authController.newUser.userEmail = textEditingController.text;
      var response = await signUpService.addEmailUser(authController.newUser);
      if (response.containsKey("success")) {
        if (response["success"] == 'true') {
          change(null, status: RxStatus.success());
          if (n == 1) {
            navigateToEmailVerification();
          } else {
            navigateToPosition();
          }
        }
      }
      if (response.containsKey('error')) {
        authController.newUser.userEmail = '';
        errorMessage.value = response["error"];
      }
    }
  }
}
