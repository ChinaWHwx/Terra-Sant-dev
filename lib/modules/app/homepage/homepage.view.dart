import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/availabilityPhar.model.dart';
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
        title: const Text("匹配到的所有药房"),
        //centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.ShowPharAvl();
          controller.ShowMyAvl_User();
          // controller.navigateAjouter();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        // child: PlaneIndicator(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [

        //         SizedBox(height: getProportionateScreenWidth(30)),
        //         const NewsBanner(),

        //       ],
        //     ),
        //   ),
        // ),
        child: AvailabilityPharsForUsers(),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: ConvexAppBar(items: const [
        TabItem(
          icon: Icons.notifications,
          title: 'Acceuil',
        ),
        TabItem(
          icon: Icons.mail,
          title: 'Messege',
        ),
        TabItem(
          icon: Icons.event_available,
          title: 'Calenderier',
        ),
        TabItem(
          icon: Icons.work,
          title: 'Mission',
        ),
        TabItem(
          icon: Icons.people,
          title: 'Moi',
        ),
      ], onTap: (int i) => controller.navigate(i)),
    );
  }
}
