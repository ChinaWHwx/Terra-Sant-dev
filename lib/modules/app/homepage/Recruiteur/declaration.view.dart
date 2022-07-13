import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Recruiteur/declaration.controller.dart';
import 'package:get/get.dart';

class DeclarationView extends GetView<DeclarationController> {
  const DeclarationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card with Textfiled'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementcard();
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.addCard.value,
          itemBuilder: (context, index) {
            return cardslist(index);
          })),
    );
  }

  Widget cardslist(int index) {
    if (controller.name.length <= index) {
      controller.name.add(TextEditingController());
      controller.tel.add(TextEditingController());
    }

    return Card(
      margin: const EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 10),
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text('Nom de pharmacie: ')),
                SizedBox(
                  height: 100,
                  child: Expanded(
                    child: TextFormField(
                      controller: controller.name[index],
                      decoration:
                          const InputDecoration(hintText: 'Nom de pharmacie'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text('Tel '),
                ),
                SizedBox(
                  height: 100,
                  child: Expanded(
                    child: TextFormField(
                      controller: controller.tel[index],
                      decoration: const InputDecoration(hintText: 'Tel:'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
