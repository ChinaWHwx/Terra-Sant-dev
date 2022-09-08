import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/signUp.service.dart';
import 'package:get/get.dart';

class InfoController extends GetxController with StateMixin {
  final String title = 'Rejoingnez Terra Santé';
  final String bonjour = 'Bonjour, si on apprenait à mieux se connaître?';
  final String enregistrer = "Enregistrez";
  final TextEditingController prenomEditingController = TextEditingController();
  final TextEditingController nomEditingController = TextEditingController();
  late final DateTime birthdayEditingController;
  SignUpService signUpService = Get.find();

  final selected = "Monsieur".obs;
  final nameErrorMessage = "".obs;
  Rx<String> errorMessage = "".obs;
  final Rx<bool> isChecked = false.obs;

  List<String> dropdownText = ['Monsieur', 'Madame', 'Autre'];

  void setSelected(value) {
    selected.value = value;
  }

  void toggleIsChecked(bool? value) {
    isChecked.value = value!;
  }

  void navigateToAddress() {
    Get.toNamed(Routes.auth);
  }

  void navigateToHomePage() {
    Get.toNamed(Routes.homepage);
  }

  void navigateToPassword() {
    Get.toNamed(Routes.passwordRoute);
  }

  validateForm(n) async {
    if (prenomEditingController.text.isEmpty ||
        nomEditingController.text.isEmpty) {
      errorMessage.value = "Champs obligatoire";
    } else if (isChecked.value == false) {
      errorMessage.value = "Il faut bien lire et valider";
    } else {
      signUpService.newUser.userFname = prenomEditingController.text;
      signUpService.newUser.userName = nomEditingController.text;
      signUpService.newUser.userBirthdate =
          birthdayEditingController.day.toString() +
              '/' +
              birthdayEditingController.month.toString() +
              '/' +
              birthdayEditingController.year.toString();
      //signUpService.newUser.userBirthdate = date as String?;
      var response = await signUpService.addNameUser();
      if (response.containsKey("success")) {
        if (response["success"] == 'true') {
          change(null, status: RxStatus.success());
          if (n == 1) {
            navigateToPassword();
          }
        }
      }
      if (response.containsKey('error')) {
        signUpService.newUser.userName = '';
        signUpService.newUser.userFname = '';
        errorMessage.value = response["error"];
      }
    }
  }
}
