import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/shared/widgets/drawer/navigation_draver.controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NavigationDrawer extends GetView<NavigationDrawerController> {
  const NavigationDrawer({Key? key}) : super(key: key);

  //var authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildDrawerHeader(),
          const Divider(
            color: Colors.grey,
          ),
          buildDrawerItem(
            icon: Icons.settings,
            text: "Settings",
            onTap: () => navigate(0, context),
            tileColor: Get.currentRoute == Routes.auth ? Colors.blue : null,
            textIconColor:
                Get.currentRoute == Routes.auth ? Colors.white : Colors.black,
          ),
          buildDrawerItem(
            icon: Icons.favorite,
            text: "Favorite",
            onTap: () => navigate(1, context),
            tileColor: Get.currentRoute == Routes.auth ? Colors.blue : null,
            textIconColor:
                Get.currentRoute == Routes.auth ? Colors.white : Colors.black,
          ),
          buildDrawerItem(
              icon: Icons.share,
              text: "Partager",
              onTap: () => navigate(2, context),
              tileColor: Get.currentRoute == Routes.auth ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.auth
                  ? Colors.white
                  : Colors.black),
          buildDrawerItem(
              icon: Icons.call,
              text: "Contacter",
              onTap: () => navigate(3, context),
              tileColor: Get.currentRoute == Routes.auth ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.auth
                  ? Colors.white
                  : Colors.black),
          buildDrawerItem(
              icon: Icons.location_on,
              text: "Google Map",
              onTap: () => navigate(4, context),
              tileColor: Get.currentRoute == Routes.auth ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.auth
                  ? Colors.white
                  : Colors.black),
          buildDrawerItem(
              icon: Icons.logout,
              text: "Déconnecter",
              onTap: () => navigate(5, context),
              tileColor: Get.currentRoute == Routes.auth ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.auth
                  ? Colors.white
                  : Colors.black),
        ],
      ),
    );
  }

  Widget buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: const Text("wx"),
      accountEmail: const Text("wx@gmail.com"),
      currentAccountPicture: Stack(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/download.jpg'),
            radius: 200,
          ),
          GestureDetector(
            onTap: () {
              controller.getPicture();
            },
          ),
          Align(
            // 编辑头像图片放在右下方。
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/edit.png',
              fit: BoxFit.contain,
              height: 24.0,
            ),
          ),
        ],
      ),
      /*
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/download.jpg'),
      ),
      */
      decoration: const BoxDecoration(
          color: Colors.yellow,
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.hardLight))),
      currentAccountPictureSize: Size.square(72),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index, context) {
    if (index == 0) {
      Get.toNamed(Routes.setting);
    } else if (index == 1) {
      Get.toNamed(Routes.bookmarksPage);
    } else if (index == 2) {
      Get.toNamed(Routes.recommend);
    } else if (index == 3) {
      Get.toNamed(Routes.contact);
    } else if (index == 4) {
      Get.toNamed(Routes.googleMap);
    } else if (index == 5) {
      Get.toNamed(Routes.logout);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Attention'),
              content: const Text('Vous êtes sûr？'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/my');
                  },
                ),
                TextButton(
                  child: const Text('Confirmer'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/auth/signin');
                  },
                ),
              ],
            );
          });
    }
  }
}
