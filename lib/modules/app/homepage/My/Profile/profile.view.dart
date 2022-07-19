import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/profile/profile.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  SignInController signInController = Get.find();
  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mon profil"),
          centerTitle: true,
          leading: const BackButton(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nom:",
                textAlign: TextAlign.left,
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              const Text(
                "Prénom:",
                textAlign: TextAlign.left,
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              const Text(
                "numéro de téléphone:",
                textAlign: TextAlign.left,
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),
              const Text(
                "Adresse:",
                textAlign: TextAlign.left,
              ),
              Center(
                child: RoundedButton(
                    text: "Modifier",
                    onTap: () => controller.navigateToModifierProfile()),
              ),
            ],
          )),
        ));
  }
}
