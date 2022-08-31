import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Candidate/candidateAvailability.controller.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';

class CandidateAvailabilityView
    extends GetView<CandidateAvailabilityController> {
  const CandidateAvailabilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My time available'),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            controller.navigateToHome();
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 310,
          ),
          FloatingActionButton(
            onPressed: () {
              controller.navigateToAddCandidateAvailability();
            },
            child: const Icon(Icons.add),
          ),
          // FloatingActionButton(
          //   onPressed: () {
          //     controller.navigateToMyRecruiter();
          //   },
          //   child: const Icon(Icons.check),
          // ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.watch),
                        title: Text('availabilityuser.date_start'),
                        subtitle: Text('availabilityuser.adress待添加'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
