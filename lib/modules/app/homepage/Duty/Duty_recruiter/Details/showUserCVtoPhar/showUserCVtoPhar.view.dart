import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/Duty/Duty_recruiter/Details/showUserCVtoPhar/showUserCVtoPhar.controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:pdfx/pdfx.dart';

//本页面已经改为 局部controller 像这样改完要在appbindings里面删除
class ShowUserCVtoPharView extends StatelessWidget {
  const ShowUserCVtoPharView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ShowUserCVtoPharController>(
        init: ShowUserCVtoPharController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Editer'),
                centerTitle: true,
              ),
              body: Container(
                margin: const EdgeInsets.only(
                    top: 40, bottom: 10, right: 10, left: 10),
                child: SafeArea(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: controller.getFile,
                            // child: PdfView(
                            //   controller: controller.getFile,
                            // ),
                            child: Text('22'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Confirmez votre status:",
                          ),
                        ],
                      )),
                ),
              ));
        });
  }
}
