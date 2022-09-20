import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/offer.model.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/rDVfixeRecru.controller.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';

class RDVFixeRecruView extends GetView<RDVFixeRecruController> {
  const RDVFixeRecruView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("药师的rdv"),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            controller.navigateToHome();
          },
        ),
      ),
      body: SafeArea(
        child: OfferForPhars(),
      ),
    );
  }
}
