import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/signUp.service.dart';
import 'package:get/get.dart';

class CandidateController extends GetxController {
  SignUpService signUpService = Get.find();
  final String title = 'Choissiez votre status:';
  final String student = 'étudiant,e';
  final String preprer = 'Préparateur,trice';
  final String pharmaciste = 'Pharmacien,ne';
  final String rentrer = 'Rentrer';

  setStatus(status) {
    signUpService.newUser.userStatus = status;
    if (status.contains("ETD")) {
      signUpService.newUser.userType = "etudiant";
    }
    navigateToSignUpRoute();
  }

  navigateToAuth() {
    Get.toNamed(Routes.auth);
  }

  navigateToSignUpRoute() {
    Get.toNamed(Routes.signUpRoute);
  }
}
