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
      ),
      body: SafeArea(
        child: AvailabilityPharsForUsers(),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: ConvexAppBar(items: [
        TabItem(
          icon: Icons.notifications,
          title: 'Acceuil',
        ),
        TabItem(
          icon: Stack(
            children: [
              const Icon(Icons.mail, color: Colors.white),
              Positioned(
                right: 0,
                top: 0,
                child: Obx(() {
                  return Visibility(
                    visible: controller.unReadMessage.value != 0,
                    child: Transform.translate(
                      offset: const Offset(5, -5),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Text(
                          '${controller.unReadMessage}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
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
