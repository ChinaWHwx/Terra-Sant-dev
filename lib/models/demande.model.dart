import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/app/homepage/homepage.controller.dart';
import 'package:flutter_application_1/modules/app/homepage/homepagePhar.controller.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

HomepageController homepageController = Get.find();

class Demande {
  Demande({
    this.demande_id,
    this.avlP_id,
    this.avlU_id,
    this.demande_time,
    this.readed,
    this.user_avlU_id,
    this.accept,
    this.refuse,
    this.newOrNot,
  });

  int? demande_id;
  int? avlP_id;
  int? avlU_id;
  String? demande_time;
  String? readed;
  String? accept;
  String? refuse;
  String? newOrNot;
  int? user_avlU_id;

  factory Demande.fromJson(Map<String, dynamic> json) => Demande(
        demande_id: json["demande_id"],
        demande_time: json["demande_time"],
        readed: json["readed"],
        newOrNot: json["newOrNot"],
        avlP_id: json["avlP_id"],
        avlU_id: json["avlU_id"],
        user_avlU_id: json["user_avlU_id"],
        accept: json["accept"],
        refuse: json["refuse"],
      );

  Map<String, dynamic> toJson() => {
        "demande_id": demande_id,
        "demande_time": demande_time,
        "avlP_id": avlP_id,
        "avlU_id": avlU_id,
        "user_avlU_id": user_avlU_id,
        "newOrNot": newOrNot,
        "readed": readed,
        "accept": accept,
        "refuse": refuse,
      };

  static List<Demande> DemandeFromJson(String str) =>
      List<Demande>.from(json.decode(str).map((x) => Demande.fromJson(x)));

  static String DemandeToJson(List<Demande> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class DemandeForUsers extends StatelessWidget {
  const DemandeForUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomepageController>(builder: (logic) {
      final list = logic.getMyDemandeUser();
      //debugPrint('list: ${list.length}');
      return EasyRefresh(
        controller: logic.controller,
        onRefresh: logic.onRefresh,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            itemBuilder: (context, index) {
              final demande = list[index];
              return DemandeForUserCard(
                demande: demande,
                onTapPencil: () {
                  //debugPrint('phone: $phone');
                  // Get.toNamed(Routes.editAVLP,
                  //     arguments: availabilityPhars); //这里是可以给下一个编辑页面传东西
                },
              );
            },
            itemCount: list.length),
      );
    });
  }
}

// class OfferForUsers extends StatelessWidget {
//   const OfferForUsers({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return GetBuilder<HomepageController>(builder: (logic) {
//       final list = logic.getMyOfferUser();

//       return EasyRefresh(
//         controller: logic.controller,
//         onRefresh: logic.onRefresh,
//         child: ListView.builder(
//             padding: EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenWidth(20)),
//             itemBuilder: (context, index) {
//               return OfferForUserCard(
//                 offer: list[index],
//                 // onTapPhone: (phone) {
//                 //   debugPrint('phone: $phone');
//                 // },
//               );
//             },
//             itemCount: list.length),
//       );
//     });
//   }
// }

class DemandeForUserCard extends StatelessWidget {
  DemandeForUserCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.demande,
    this.onTapPhone,
    this.onTapPencil, //这里加属性
    this.onTapPoubelle,
  }) : super(key: key);

  final double width, aspectRetio;
  final Demande demande;
  final ValueChanged<int>? onTapPhone;
  final VoidCallback? onTapPencil; //这里加属性
  final VoidCallback? onTapPoubelle;

  // var newMessage = 'YES'.obs;

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
              // Positioned(
              //   right: 0,
              //   top: 0,
              //   child: Obx(() {
              //     return Visibility(
              //       visible: newMessage.value == 'YES',
              //       child: Transform.translate(
              //         offset: const Offset(150, -60),
              //         child: Container(
              //           padding: const EdgeInsets.all(2),
              //           decoration: const BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.red,
              //           ),
              //           child: Text(
              //             '${newMessage}',
              //             style: const TextStyle(
              //               fontSize: 10,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   }),
              // ),
              SizedBox(height: getProportionateScreenWidth(30)),
              Text(
                "offer_description: ${demande.avlP_id}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              LikeButton(
                countPostion: CountPostion.left,
                onTap: (isLiked) {
                  if (isLiked) {
                    return Future.value(null);
                  }
                  onTapPhone?.call(demande.avlP_id ?? 0);
                  final avlP = homepageController.list1.firstWhere(
                      (element) => element.avlP_id == demande.avlP_id);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('详情'),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "详情:",
                                  ),
                                  Text(
                                    "写avlP,phar更多信息: ${avlP.status_needed}",
                                  ),
                                ]),
                            actions: <Widget>[
                              TextButton(
                                child: new Text("再考虑一下"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text("接受"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  //发送邮件给terra 说接受这个请求。
                                  //accept字段设为Yes
                                  //不能再删除了
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text('Confirmation'),
                                            content: Text(('我们会给你发合同')),
                                            actions: <Widget>[
                                              // TextButton(
                                              //   child: new Text("Cancel"),
                                              //   onPressed: () {
                                              //     Navigator.of(context).pop();
                                              //   },
                                              // ),
                                              TextButton(
                                                child: Text("ok"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ));
                                },
                              ),
                            ],
                          ));

                  return Future.value(!isLiked);
                },
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.mode_edit,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                    size: 35,
                  );
                },
              ),
              LikeButton(
                countPostion: CountPostion.left,
                onTap: (isLiked) {
                  if (isLiked) {
                    return Future.value(null);
                  }
                  onTapPhone?.call(demande.avlP_id ?? 0);
                  final avlP = homepageController.list1.firstWhere(
                      (element) => element.avlP_id == demande.avlP_id);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('拒绝并不再显示？？？'),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "删除此条消息",
                                  ),
                                ]),
                            actions: <Widget>[
                              TextButton(
                                child: new Text("再考虑一下"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text("确认删除"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  //发送邮件给本avlP对应的邮箱 说拒绝这个请求。
                                  //发邮件给terra说拒绝了
                                  //refuse字段设为yes
                                },
                              ),
                            ],
                          ));

                  return Future.value(!isLiked);
                },
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

// class OfferForUserCard extends StatelessWidget {
//   OfferForUserCard({
//     Key? key,
//     this.width = 140,
//     this.aspectRetio = 1.02,
//     required this.offer,
//     this.onTapPhone,
//   }) : super(key: key);

//   final double width, aspectRetio;
//   final Offer offer;
//   final ValueChanged<String>? onTapPhone;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
//       child: SizedBox(
//         // width: getProportionateScreenWidth(width),
//         child: Card(
//           color: Color(0xFFA3FBF2),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 width: 400,
//               ),
//               SizedBox(height: getProportionateScreenWidth(30)),
//               Text(
//                 "avlP_id: ${offer.avlP_id}",
//                 style: const TextStyle(color: Colors.black, fontSize: 18),
//                 maxLines: 4,
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 "avlU_id: ${offer.avlU_id}",
//                 style: const TextStyle(color: Colors.black, fontSize: 18),
//                 maxLines: 4,
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: getProportionateScreenWidth(30)),
//               LikeButton(
//                 countPostion: CountPostion.left,
//                 onTap: (b) {
//                   onTapPhone?.call(offer.offer_description ?? '');

//                   return Future.value(false);
//                 },
//                 likeBuilder: (bool isLiked) {
//                   return Icon(
//                     Icons.phone_forwarded,
//                     color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
//                     size: 35,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
