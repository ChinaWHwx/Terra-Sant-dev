import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/ajouterPharmacie/ajouterPharmacie.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class AjouterPharmacieView extends StatefulWidget {
  AjouterPharmacieView({Key? key}) : super(key: key);

  @override
  State<AjouterPharmacieView> createState() => AjouterPharmacieViewState();
}

class AjouterPharmacieViewState extends State<AjouterPharmacieView> {
  // @override
  // void dispose() {
  //   Get.delete();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AjouterPharmacieController>(
        init: AjouterPharmacieController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Ajouter un Pharmacie'),
                centerTitle: true,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.homepagePharController.onRefresh();
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Card(
                margin: const EdgeInsets.only(
                    top: 40, bottom: 10, right: 10, left: 10),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Expanded(
                          child: TextFormField(
                            controller: controller.name,
                            decoration:
                                const InputDecoration(hintText: 'Nom du Phar:'),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.placeController,
                        decoration: const InputDecoration(
                            hintText: 'Search places with name'),
                      ),
                      Flexible(
                          child: controller.obx((state) => ListView.builder(
                              itemCount: controller.placesList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () async {
                                    controller.placeController.text = controller
                                        .placesList[index]['description'];
                                    // ignore: unused_local_variable
                                    List<Location> locations =
                                        await locationFromAddress(controller
                                            .placesList[index]['description']);
                                  },
                                  title: Text(controller.placesList[index]
                                      ['description']),
                                );
                              }))),
                      SizedBox(
                        height: 30,
                        child: Expanded(
                          child: TextFormField(
                            controller: controller.tel,
                            decoration: const InputDecoration(hintText: 'Tel:'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //   child: Expanded(
                      //     child: TextFormField(
                      //       controller: controller.nameResponsable,
                      //       decoration: const InputDecoration(hintText: '负责人名字:'),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50,
                        child: Expanded(
                          child: TextFormField(
                            controller: controller.codePostal,
                            decoration:
                                const InputDecoration(hintText: 'Code Postal:'),
                          ),
                        ),
                      ),
                      Obx(() => controller.errorMessage.isNotEmpty
                          ? Text(
                              controller.errorMessage.value,
                              style: const TextStyle(color: Colors.red),
                            )
                          : const SizedBox()),
                      RoundedButton(
                          text: "Enregistrer",
                          onTap: () => controller.validateForm())
                    ],
                  ),
                ),
              ));
        });
  }
}
