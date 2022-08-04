import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/duty.controller.dart';
import 'package:get/get.dart';

class DutyRecruiterView extends GetView<DutyRecruiterController> {
  const DutyRecruiterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Mission'),
            centerTitle: true,
            backgroundColor: Colors.blue,
            leading: const BackButton(color: Colors.white),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.lock_clock),
                text: "Historique",
              ),
              Tab(
                icon: Icon(Icons.work),
                text: "En cours",
              ),
              Tab(
                icon: Icon(Icons.check),
                text: "Future",
              ),
            ]),
          ),
          body: TabBarView(children: [
            ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Badge(
                          badgeContent: Text(
                            controller.recent.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Icon(Icons.lock_clock),
                          badgeColor: Colors.red,
                          toAnimate: true,
                          showBadge: controller.recent > 0 ? true : false,
                        ),
                        title: const Text('Pharmacie Casino'),
                        subtitle: const Text(
                            '18 rue paul langevin, val de fontenay, 94120'),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.navigateToRecentDetail();
                        },
                        child: const Text('Voir les details'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Badge(
                          badgeContent: Text(
                            controller.recent.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Icon(Icons.work),
                          badgeColor: Colors.red,
                          toAnimate: true,
                          showBadge: controller.recent > 0 ? true : false,
                        ),
                        title: const Text('Mes missions avant'),
                        subtitle: const Text(
                            'Pharmacie Casino, 18 rue paul langevin, val de fontenay, 94120'),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.navigateToNowDetail();
                        },
                        child: const Text('Voir les details'),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Badge(
                          badgeContent: Text(
                            controller.recent.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Icon(Icons.check),
                          badgeColor: Colors.red,
                          toAnimate: true,
                          showBadge: controller.recent > 0 ? true : false,
                        ),
                        title: const Text('Mes missions avant'),
                        subtitle: const Text(
                            'Pharmacie Casino, 18 rue paul langevin, val de fontenay, 94120'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              controller.navigateToDescription();
                            },
                            child: const Text('Ajouter la description'),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              controller.navigateToFutureDetail();
                            },
                            child: const Text('Voir les details'),
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
