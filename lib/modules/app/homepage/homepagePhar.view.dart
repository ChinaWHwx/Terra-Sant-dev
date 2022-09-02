import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/shared/plane_indicator.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';

class HomepagePharView extends GetView<HomepagePharController> {
  const HomepagePharView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My alerte candidates"),
        //centerTitle: true,
      ),
      body: SafeArea(
        child: PlaneIndicator(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenWidth(20)),
                const HomeHeader(),
                SizedBox(height: getProportionateScreenWidth(30)),
                const NewsBanner(),
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
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: ConvexAppBar(items: const [
        TabItem(
          icon: Icons.groups,
          title: 'Acceuil',
        ),
        TabItem(
          icon: Icons.list,
          title: 'MesPhars',
        ),
        TabItem(
          icon: Icons.person_search,
          title: 'I Need',
        ),
        TabItem(
          icon: Icons.work,
          title: 'RDV',
        ),
        TabItem(
          icon: Icons.people,
          title: 'Moi',
        ),
      ], onTap: (int i) => controller.navigate(i)),
    );
  }
}
