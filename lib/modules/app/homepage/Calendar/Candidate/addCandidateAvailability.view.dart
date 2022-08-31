import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/addCandidateAvailability.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/ajouterPharmacie/ajouterPharmacie.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class AddCandidateAvailabilityView
    extends GetView<AddCandidateAvailabilityController> {
  const AddCandidateAvailabilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add user availability'),
          centerTitle: true,
        ),
        body: Card(
          margin:
              const EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 10),
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Expanded(
                    child: TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(hintText: 'Date:'),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.placeController,
                  decoration: const InputDecoration(
                      hintText: 'Search places with name'),
                ),
                Expanded(
                    child: controller.obx((state) => ListView.builder(
                        itemCount: controller.placesList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () async {
                              controller.placeController.text =
                                  controller.placesList[index]['description'];
                              // ignore: unused_local_variable
                              List<Location> locations =
                                  await locationFromAddress(controller
                                      .placesList[index]['description']);
                            },
                            title: Text(
                                controller.placesList[index]['description']),
                          );
                        }))),
                SizedBox(
                  height: 20,
                  child: Expanded(
                    child: TextFormField(
                      controller: controller.tel,
                      decoration: const InputDecoration(hintText: 'repeat:'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Expanded(
                    child: TextFormField(
                      controller: controller.nameResponsable,
                      decoration: const InputDecoration(hintText: 'time:'),
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
                    text: "Enregistrer", onTap: () => controller.validateForm())
              ],
            ),
          ),
        ));
  }
}
