import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class AvailabilityUser {
  AvailabilityUser({
    this.avlUId,
    this.repeat_candidate,
    this.time_of_day_candidate,
    this.date_month_year_candidate,
    this.region_candidate,
    this.user_id,
  });

  int? avlUId;
  String? repeat_candidate;
  String? time_of_day_candidate;
  String? date_month_year_candidate;
  String? region_candidate;
  int? user_id;

  factory AvailabilityUser.fromJson(Map<String, dynamic> json) =>
      AvailabilityUser(
        avlUId: json["avlU_id"],
        repeat_candidate: json["repeat_candidate"],
        time_of_day_candidate: json["time_of_day_candidate"],
        date_month_year_candidate: json["date_month_year_candidate"],
        region_candidate: json["region_candidate"],
        user_id: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "avlU_id": avlUId,
        "repeat_candidate": repeat_candidate,
        "time_of_day_candidate": time_of_day_candidate,
        "date_month_year_candidate": date_month_year_candidate,
        "region_candidate": region_candidate,
        "user_id": user_id,
      };

  static List<AvailabilityUser> availabilityUserFromJson(String str) =>
      List<AvailabilityUser>.from(
          json.decode(str).map((x) => AvailabilityUser.fromJson(x)));

  static String availabilityUserToJson(List<AvailabilityUser> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class AvailabilityUsersForPhars extends StatelessWidget {
  const AvailabilityUsersForPhars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomepagePharController>(builder: (logic) {
      final list = logic.getList1();
      debugPrint('list: ${list.length}');
      return EasyRefresh(
        controller: logic.controller,
        onRefresh: logic.onRefresh,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            itemBuilder: (context, index) {
              return AvailabilityUsersForShowCard(
                availabilityUsers: list[index],
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

class AvailabilityUsersForUsers extends StatelessWidget {
  const AvailabilityUsersForUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final list = Get.find<HomepageController>().list2;
    // SizeConfig().init(context);
    // return Padding(
    //   padding:
    //       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //   child: ListView.builder(
    //       itemBuilder: (context, index) {
    //         return AvailabilityUsersForEditCard(
    //           availabilityUsers: list[index],
    //         );
    //       },
    //       itemCount: list.length),
    // );
    SizeConfig().init(context);
    return GetBuilder<HomepageController>(builder: (logic) {
      final list = logic.list2;

      return EasyRefresh(
        controller: logic.controller,
        onRefresh: logic.onRefresh,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            itemBuilder: (context, index) {
              return AvailabilityUsersForEditCard(
                availabilityUsers: list[index],
                // onTapPhone: (phone) {
                //   debugPrint('phone: $phone');
                // },
              );
            },
            itemCount: list.length),
      );
    });
  }
}

class AvailabilityUsersForEditCard extends StatelessWidget {
  AvailabilityUsersForEditCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.availabilityUsers,
  }) : super(key: key);

  final double width, aspectRetio;
  final AvailabilityUser availabilityUsers;

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
                "region_candidate: ${availabilityUsers.region_candidate}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "date_month_year_candidate: ${availabilityUsers.date_month_year_candidate}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "repeat_candidate: ${availabilityUsers.repeat_candidate}",
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

class AvailabilityUsersForShowCard extends StatelessWidget {
  AvailabilityUsersForShowCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.availabilityUsers,
    this.onTapPhone,
  }) : super(key: key);

  final double width, aspectRetio;
  final AvailabilityUser availabilityUsers;
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
                "region_candidate: ${availabilityUsers.region_candidate}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "date_month_year_candidate: ${availabilityUsers.date_month_year_candidate}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "repeat_candidate: ${availabilityUsers.repeat_candidate}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              LikeButton(
                countPostion: CountPostion.left,
                onTap: (b) {
                  onTapPhone?.call(availabilityUsers.region_candidate ?? '');

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
