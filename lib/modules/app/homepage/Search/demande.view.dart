import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/demande.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/homepage/Search/demande.controller.dart';
import 'package:flutter_application_1/shared/plane_indicator.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';

class DemandeView extends GetView<DemandeController> {
  const DemandeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My demande received"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            controller.navigateToHome();
          },
        ),
      ),
      body: SafeArea(
        child: DemandeForUsers(),
      ),
    );
  }
}
