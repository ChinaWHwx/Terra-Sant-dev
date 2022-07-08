import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'profile.controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text("Mon profil"),
          centerTitle: true,
          leading: const BackButton(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
              child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // ignore: unrelated_type_equality_checks
              Obx(() => controller.selectedImagePath == ''
                  ? const Text(
                      'Select image from camera/galley',
                      style: TextStyle(fontSize: 20),
                    )
                  : CircleAvatar(
                      radius: 98,
                      backgroundColor: Colors.white,
                      child: Image.file(
                          File(controller.selectedImagePath.value)))),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  controller.selectedImageSize.value,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: const Text("Gallery"),
              ),
            ]),
          )),
        ));
  }
}
