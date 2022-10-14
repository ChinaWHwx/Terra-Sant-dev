//import 'dart:html';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/availabilityUser.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/availabilityUser.service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

class ShowUserCVtoPharController extends GetxController
    with StateMixin<List<dynamic>> {
  final String details = 'Détails';
  Rx<String> errorMessage = "".obs;
  final TextEditingController dateEditingController = TextEditingController();

  final TextEditingController tempsDebutEditingController =
      TextEditingController();

  final TextEditingController tempsFinEditingController =
      TextEditingController();
  DateTime? dateController;
  late TextEditingController competence;
  late TextEditingController codePostal;
  late int? oldPharID;
  final homepageController = Get.find<HomepageController>();
  final signInController = Get.find<SignInController>();
  final availabilityUsers = Get.arguments as AvailabilityUser;
  AvailabilityUserService availabilityUserService = Get.find();

//这里获取上一个页面传来的数据
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
    final availabilityUsers = Get.arguments as AvailabilityUser;
// //然后就能得到本avlp的phNa
//     int user_id = availabilityUsers.user_id ?? 0;
  }

  Future getFile() async {
    var dio = Dio();
    try {
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/test.pdf');
      debugPrint('path: ${file.path}');
      dio.download(
          'http://51.178.83.92:5000/download=${availabilityUsers.user_id}',
          file.path, onReceiveProgress: (count, total) {
        debugPrint('count: $count total: $total');

        Visibility(visible: count != total, child: Text('转圈 加载中'));

        setPDFcontroller(file.path);
      });
    } catch (e) {
      debugPrint('e: $e');
    }
  }

  Future setPDFcontroller(String path) async {
    final pdfController = PdfController(
      document: PdfDocument.openAsset(path),
    );
    return pdfController;
  }
}
