import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/routes/app.pages.dart';

class DutyRecruiterController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final String duty = 'Mission';
  int recent = 1;
  int now = 1;
  int future = 1;
  var count = 0.obs;
  navigateToAuth() {
    Get.toNamed(Routes.homepageRoute);
  }

  Rx<int> removeCard = 0.obs;
  void incrementcard() {
    if (removeCard.value >= 0) {
      return;
    }

    removeCard.value--;
  }

  navigateToFutureDetail() {
    Get.toNamed(Routes.detailFutureRecruiter);
  }

  navigateToNowDetail() {
    Get.toNamed(Routes.detailNowRecruiter);
  }

  navigateToRecentDetail() {
    Get.toNamed(Routes.detailPassRecruiter);
  }

  navigateToDescription() {
    Get.toNamed(Routes.description);
  }
}
