import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/explorer_pharmacie.model.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/homepage/Calendar/Recruiter/declaration.controller.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DeclarationView extends GetView<DeclarationController> {
  const DeclarationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Pharmacies'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.navigateAjouter();
        },
        child: const Icon(Icons.add),
      ),
      // body: Obx(() => ListView.builder(
      //         // itemCount: controller.addCard.value,
      //         itemBuilder: (context, index) {
      //       return cardslist(index);
      //     })),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                SizedBox(height: 30),
                Pharmacies(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pharmacies extends StatelessWidget {
  const Pharmacies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              demoPharmacies.length,
              (index) => PharmaciesCard(
                    pharmacy: demoPharmacies[index],
                  ))
        ],
      ),
    );
  }
}

class PharmaciesCard extends StatelessWidget {
  PharmaciesCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.pharmacy,
  }) : super(key: key);

  final double width, aspectRetio;
  final Pharmacy pharmacy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: SizedBox(
        // width: getProportionateScreenWidth(width),
        child: Card(
          color: Color(0xFFA3FBF2),
          child: Column(
            children: [
              const SizedBox(
                width: 400,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              // Text(
              //   "ownerId: " + pharmacy.ownerId.toString(),
              //   style: const TextStyle(color: Colors.black, fontSize: 18),
              //   maxLines: 2,
              // ),
              Text(
                "Address: " + pharmacy.phAddress,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "Email: " + pharmacy.phEmail,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              // Text(
              //   "phEmailConf: " + pharmacy.phEmailConf.toString(),
              //   style: const TextStyle(color: Colors.black, fontSize: 18),
              //   maxLines: 2,
              // ),
              // Text(
              //   "phId: " + pharmacy.phId.toString(),
              //   style: const TextStyle(color: Colors.black, fontSize: 18),
              //   maxLines: 2,
              // ),
              Text(
                "Nom: " + pharmacy.phName,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
              ),
              Text(
                "Num Tél: " + pharmacy.phPhone,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
              ),
              // Text(
              //   "phPhoneConf: " + pharmacy.phPhoneConf.toString(),
              //   style: const TextStyle(color: Colors.black, fontSize: 18),
              //   maxLines: 2,
              // ),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}


  // Widget cardslist(int index) {
  //   if (controller.name.length <= index) {
  //     controller.name.add(TextEditingController());
  //     controller.tel.add(TextEditingController());
  //   }

  //   return Card(
  //       margin: const EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 10),
  //       child: Container(
  //         padding: const EdgeInsets.all(30),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 //           Container(
  //                 //               margin: const EdgeInsets.all(10),
  //                 //               child: const Text('Nom de pharmacie: ')),
  //                 //           SizedBox(
  //                 //             height: 100,
  //                 //             child: Expanded(
  //                 //               child: TextFormField(
  //                 //                 controller: controller.name[index],
  //                 //                 decoration:
  //                 //                     const InputDecoration(hintText: 'Nom de pharmacie'),
  //                 //               ),
  //                 //             ),
  //                 //           ),
  //                 //           Container(
  //                 //             margin: const EdgeInsets.all(10),
  //                 //             child: const Text('Tel '),
  //                 //           ),
  //                 //           SizedBox(
  //                 //             height: 100,
  //                 //             child: Expanded(
  //                 //               child: TextFormField(
  //                 //                 controller: controller.tel[index],
  //                 //                 decoration: const InputDecoration(hintText: 'Tel:'),
  //                 //               ),
  //                 //             ),
  //                 //           ),
  //                 //         ],
  //                 //       ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ));
  // }

