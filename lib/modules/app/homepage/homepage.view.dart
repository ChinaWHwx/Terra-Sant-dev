import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';
import 'package:flutter_application_1/shared/plane_indicator.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_drawer.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
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
                SizedBox(height: getProportionateScreenWidth(30)),
                const Categories(),
                SizedBox(height: getProportionateScreenWidth(30)),
                const SpecialOffers(),
                SizedBox(height: getProportionateScreenWidth(30)),
                const PopularProducts(),
                SizedBox(height: getProportionateScreenWidth(50)),
              ],
            ),
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: ConvexAppBar(items: const [
        TabItem(
          icon: Icons.home,
          title: 'Acceuil',
        ),
        TabItem(icon: Icons.search, title: 'Explorer'),
        TabItem(icon: Icons.calendar_month, title: 'Calenderier'),
        TabItem(icon: Icons.work, title: 'Mission'),
        TabItem(icon: Icons.people, title: 'Moi'),
      ], onTap: (int i) => controller.navigate(i)),
    );
  }
}
