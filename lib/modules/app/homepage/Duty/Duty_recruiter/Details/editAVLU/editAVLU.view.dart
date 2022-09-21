import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/Future/editAVLP/editAVLP.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/editAVLU/editAVLU.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/EditMyPharmacy/editMyPharmacy.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/ajouterPharmacie/ajouterPharmacie.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

//本页面已经改为 局部controller 像这样改完要在appbindings里面删除
class EditAVLUView extends StatelessWidget {
  const EditAVLUView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<EditAVLUController>(
        init: EditAVLUController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('编辑我已经有的AVLU'),
                centerTitle: true,
              ),
              body: Container(
                margin: const EdgeInsets.only(
                    top: 40, bottom: 10, right: 10, left: 10),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Choissiez vos pharmacies:",
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
