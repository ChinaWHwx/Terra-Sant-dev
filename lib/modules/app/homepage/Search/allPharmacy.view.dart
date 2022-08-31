import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pharmacy.model.dart';
import 'package:flutter_application_1/modules/app/homepage/Search/allPharmacy.controller.dart';
import 'package:flutter_application_1/shared/plane_indicator.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';

class AllPharmacyView extends GetView<AllPharmacyController> {
  const AllPharmacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("All the pharmacie"),
          //centerTitle: true,
        ),
        body: SafeArea(
          child: PlaneIndicator(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenWidth(20)),

                  SizedBox(height: getProportionateScreenWidth(30)),
                  const NewsBanner(),
                  Pharmacies(),
                  // SizedBox(height: getProportionateScreenWidth(30)),
                  // const Categories(),
                  // SizedBox(height: getProportionateScreenWidth(30)),
                  // const SpecialOffers(),
                  // SizedBox(height: getProportionateScreenWidth(30)),
                  // const PopularProducts(),
                  // SizedBox(height: getProportionateScreenWidth(50)),
                ],
              ),
            ),
          ),
        ));
  }
}
