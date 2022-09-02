import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/addCandidateAvailability.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/My/pharmacie/ajouterPharmacie/ajouterPharmacie.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCandidateAvailabilityView
    extends GetView<AddCandidateAvailabilityController> {
  AddCandidateAvailabilityView({Key? key}) : super(key: key);
  final calendarController1 = AddCandidateAvailabilityController();
  final calendarController2 = AddCandidateAvailabilityController();
  final calendarController3 = AddCandidateAvailabilityController();
  final calendarController4 = AddCandidateAvailabilityController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: const Text("Calendar"),
          centerTitle: true,
          leading: const BackButton(color: Colors.white),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Vous pouvez choisir plusieurs temps qui vous conviennent..",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(
                () => Text(
                  DateFormat("EEE, dd-MM-yyyy")
                      .format(controller.selectedDateStart.value)
                      .toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Card(
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Saisir ici vos compétance",
                      hintText: "ex. Je suis un dentist ...",
                      prefixIcon: Icon(Icons.vaccines),
                      // border: InputBorder.none
                    )),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Obx(
                      () => ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text("Choisiez votre temps libres"),
                        subtitle: Text(
                            calendarController1.chosenDateStart.value +
                                ' - ' +
                                calendarController1.chosenTimeStart.value +
                                ' --> ' +
                                calendarController1.chosenDateEnd.value +
                                ' - ' +
                                calendarController1.chosenTimeEnd.value),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Début'),
                          onPressed: () {
                            calendarController1.chooseTime(
                                calendarController1.selectedDateStart,
                                calendarController1.selectedTimeStart,
                                calendarController1.chosenDateStart,
                                calendarController1.chosenTimeStart);
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Fin'),
                          onPressed: () {
                            calendarController1.chooseTime(
                                calendarController1.selectedDateEnd,
                                calendarController1.selectedTimeEnd,
                                calendarController1.chosenDateEnd,
                                calendarController1.chosenTimeEnd);
                            print(calendarController1.chosenDateEnd.toString());
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    )
                  ],
                ),
              ),
              RoundedButton(
                  text: "Enregistrez",
                  onTap: () => controller.navigateToHomePage()),
            ],
          )),
        ));
  }
}
