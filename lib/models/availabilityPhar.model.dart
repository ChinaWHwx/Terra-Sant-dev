import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class AvailabilityPhar {
  AvailabilityPhar({
    this.avlP_id,
    this.ph_id,
    this.repeat_phar,
    this.time_of_day_phar,
    this.date_month_year_phar,
    this.owner_id,
  });

  int? avlP_id;
  int? ph_id;
  String? repeat_phar;
  String? time_of_day_phar;
  String? date_month_year_phar;
  int? owner_id;

  factory AvailabilityPhar.fromJson(Map<String, dynamic> json) =>
      AvailabilityPhar(
        avlP_id: json["avlP_id"],
        ph_id: json["ph_id"],
        owner_id: json["owner_id"],
        repeat_phar: json["repeat_phar"],
        time_of_day_phar: json["time_of_day_phar"],
        date_month_year_phar: json["date_month_year_phar"],
      );

  Map<String, dynamic> toJson() => {
        "avlP_id": avlP_id,
        "ph_id": ph_id,
        "owner_id": owner_id,
        "repeat_phar": repeat_phar,
        "time_of_day_phar": time_of_day_phar,
        "date_month_year_phar": date_month_year_phar,
      };

  static List<AvailabilityPhar> availabilityPharFromJson(String str) =>
      List<AvailabilityPhar>.from(
          json.decode(str).map((x) => AvailabilityPhar.fromJson(x)));

  static String availabilityPharToJson(List<AvailabilityPhar> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class AvailabilityPharsForUsers extends StatelessWidget {
  const AvailabilityPharsForUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final list = Get.find<HomepageController>().getList1();
    // SizeConfig().init(context);
    // return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //       itemBuilder: (context, index) {
    //         return AvailabilityPharsForShowCard(
    //           availabilityPhars: list[index],
    //         );
    //       },
    //       itemCount: list.length),
    // );
    return GetBuilder<HomepageController>(builder: (logic) {
      final list = logic.getList1();
      debugPrint('list: ${list.length}');
      return EasyRefresh(
        controller: logic.controller,
        onRefresh: logic.onRefresh,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            itemBuilder: (context, index) {
              return AvailabilityPharsForShowCard(
                availabilityPhars: list[index],
                onTapPhone: (phone) {
                  debugPrint('phone: $phone');
                },
              );
            },
            itemCount: list.length),
      );
    });
  }
}

class AvailabilityPharsForPhars extends StatelessWidget {
  const AvailabilityPharsForPhars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Get.find<HomepagePharController>().list2;
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemBuilder: (context, index) {
            return AvailabilityPharsForEditCard(
              availabilityPhars: list[index],
            );
          },
          itemCount: list.length),
    );
  }
}

class AvailabilityPharsForShowCard extends StatelessWidget {
  AvailabilityPharsForShowCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.availabilityPhars,
    this.onTapPhone,
  }) : super(key: key);

  final double width, aspectRetio;
  final AvailabilityPhar availabilityPhars;
  final ValueChanged<String>? onTapPhone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: SizedBox(
        // width: getProportionateScreenWidth(width),
        child: Card(
          color: Color(0xFFA3FBF2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 400,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              Text(
                "time_of_day_phar: ${availabilityPhars.time_of_day_phar}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "date_month_year_phar: ${availabilityPhars.date_month_year_phar}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "ph_id: ${availabilityPhars.ph_id}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              LikeButton(
                countPostion: CountPostion.left,
                onTap: (b) {
                  onTapPhone
                      ?.call(availabilityPhars.date_month_year_phar ?? '');

                  return Future.value(false);
                },
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.phone_forwarded,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                    size: 35,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvailabilityPharsForEditCard extends StatelessWidget {
  AvailabilityPharsForEditCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.availabilityPhars,
  }) : super(key: key);

  final double width, aspectRetio;
  final AvailabilityPhar availabilityPhars;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: SizedBox(
        // width: getProportionateScreenWidth(width),
        child: Card(
          color: Color(0xFFA3FBF2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 400,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              Text(
                "time_of_day_phar: ${availabilityPhars.time_of_day_phar}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "date_month_year_phar: ${availabilityPhars.date_month_year_phar}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "ph_id: ${availabilityPhars.ph_id}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.mode_edit,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                    size: 35,
                  );
                },
              ),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.delete,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                    size: 35,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
