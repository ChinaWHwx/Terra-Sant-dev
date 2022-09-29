import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class DocumentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  RxList<File> selectedFiles = <File>[].obs;

  String image =
      'https://ouch-cdn2.icons8.com/84zU-uvFboh65geJMR5XIHCaNkx-BZ2TahEpE9TpVJM/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODU5/L2E1MDk1MmUyLTg1/ZTMtNGU3OC1hYzlh/LWU2NDVmMWRiMjY0/OS5wbmc.png';
  late AnimationController loadingController;

  File? file;
  PlatformFile? platformFile;

  @override
  void onInit() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {});

    super.onInit();
  }

  navigateToWelcome() {
    Get.toNamed(Routes.welcomeRoute);
  }

  navigateToFiles() {}

  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      selectedFiles.addAll(files);
    } else {
      // User canceled the picker
    }
  }
}
