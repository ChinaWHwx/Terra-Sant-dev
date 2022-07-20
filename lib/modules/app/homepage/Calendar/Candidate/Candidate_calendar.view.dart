import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/Candidate_calendar.controller.dart';
import 'package:flutter_application_1/shared/widgets/button/rounded_button.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CandidateCalendarView extends GetView<CandidateCalendarController> {
  final calendarController1 = CandidateCalendarController();
  final calendarController2 = CandidateCalendarController();
  final calendarController3 = CandidateCalendarController();
  final calendarController4 = CandidateCalendarController();

  CandidateCalendarView({Key? key}) : super(key: key);

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
              /*
              const Card(
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText:
                          "Saisir ici des compétance que vous avez besoin",
                      hintText: "ex. Je voudrais un dentist",
                      prefixIcon: Icon(Icons.vaccines),
                      // border: InputBorder.none
                    )),
              ),
              */
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Obx(
                      () => ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text("Choisissez votre temps libre"),
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
                          onPressed: () async {
                            await calendarController1.chooseTime("start");
                            calendarController1.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Fin'),
                          onPressed: () async {
                            await calendarController1.chooseTime("end");
                            //print(calendarController1.chosenDateEnd.toString());
                            calendarController1.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Obx(
                      () => ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text("Choisissez votre temps libres"),
                        subtitle: Text(
                            calendarController2.chosenDateStart.value +
                                ' - ' +
                                calendarController2.chosenTimeStart.value +
                                ' --> ' +
                                calendarController2.chosenDateEnd.value +
                                ' - ' +
                                calendarController2.chosenTimeEnd.value),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Début'),
                          onPressed: () {
                            calendarController2.chooseTime("start");
                            calendarController2.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Fin'),
                          onPressed: () {
                            calendarController2.chooseTime("end");
                            calendarController2.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Obx(
                      () => ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text("Choisissez votre temps libres"),
                        subtitle: Text(
                            calendarController3.chosenDateStart.value +
                                ' - ' +
                                calendarController3.chosenTimeStart.value +
                                ' --> ' +
                                calendarController3.chosenDateEnd.value +
                                ' - ' +
                                calendarController3.chosenTimeEnd.value),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Début'),
                          onPressed: () {
                            calendarController3.chooseTime("start");
                            calendarController3.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Fin'),
                          onPressed: () {
                            calendarController3.chooseTime("end");
                            calendarController3.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Obx(
                      () => ListTile(
                        leading: const Icon(Icons.work),
                        title: const Text("Choisissez votre temps libres"),
                        subtitle: Text(
                            calendarController4.chosenDateStart.value +
                                ' - ' +
                                calendarController4.chosenTimeStart.value +
                                ' --> ' +
                                calendarController4.chosenDateEnd.value +
                                ' - ' +
                                calendarController4.chosenTimeEnd.value),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Début'),
                          onPressed: () {
                            calendarController4.chooseTime("start");
                            calendarController4.updateAvailability();
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Fin'),
                          onPressed: () {
                            calendarController4.chooseTime("end");
                            calendarController4.updateAvailability();
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
