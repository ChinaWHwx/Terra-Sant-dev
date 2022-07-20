import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/My/profile/modify/modify_profile.controller.dart';
import 'package:get/get.dart';

class ModifiyProfileView extends GetView<ModifiyProfileController> {
  const ModifiyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Modifier votre profil"),
          centerTitle: true,
          leading: const BackButton(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
              child: Column(
            children: const [
              Text(
                "Nom:",
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                "Prénom:",
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                "numéro de téléphone:",
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                "Adresse:",
                textAlign: TextAlign.center,
              ),
            ],
          )),
        ));
  }
}
