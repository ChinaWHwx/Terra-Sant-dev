import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/Future/ajouteMission/ajoute_mission.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class AjouterMissionView extends GetView<AjouterMissionController> {
  const AjouterMissionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Déclaration'),
          centerTitle: true,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              controller.navigateToHome();
            },
          ),
        ),
        body: Container(
          margin:
              const EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 10),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choissiez vos pharmacies:",
                ),
                Obx(() => DropdownButton(
                      iconSize: 24,
                      isExpanded: true,
                      onChanged: (newValue) {
                        controller.setSelected(0, newValue);
                      },
                      value: controller.selected.value,
                      items: controller.dropdownText
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                const Text(
                  "Choissiez un status que vous avez besoin:",
                ),
                Obx(() => DropdownButton(
                      isExpanded: true,
                      iconSize: 24,
                      onChanged: (newValue) {
                        controller.setSelected(1, newValue);
                      },
                      value: controller.selectedForStatus.value,
                      items: controller.dropdownTextForStatus
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                const Text(
                  "Choissiez votre habitude:",
                ),
                Obx(() => DropdownButton(
                      iconSize: 24,
                      isExpanded: true,
                      onChanged: (newValue) {
                        controller.setSelected(2, newValue);
                      },
                      value: controller.selectedRepeate.value,
                      items: controller.dropdownTextRepeate
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.dateEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date:DD/MM/AAAA',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.tempsDebutEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Temps de début: HH:MM en 24H',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.tempsFinEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Temps de fin: HH:MM en 24H',
                  ),
                ),
                Obx(() => controller.errorMessage.isNotEmpty
                    ? Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      )
                    : SizedBox(height: size.height * 0.03)),
                RoundedButton(
                    text: "Enregistrer", onTap: () => controller.validateForm())
              ],
            ),
          ),
        ));
  }
}
