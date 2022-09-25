import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/availabilityPhar.model.dart';
import 'package:flutter_application_1/models/availabilityUser.model.dart';
import 'package:flutter_application_1/models/demande.model.dart';
import 'package:flutter_application_1/models/offer.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/availabilityPhar.service.dart';
import 'package:flutter_application_1/services/availabilityUser.service.dart';
import 'package:flutter_application_1/services/demande.service.dart';
import 'package:flutter_application_1/services/offer.service.dart';
import 'package:flutter_application_1/shared/utils/helper.utils.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController with StateMixin {
  AvailabilityUserService availabilityUserService = Get.find();
  OfferService offerService = Get.find();
  DemandeService demandeService = Get.find();
  AvailabilityPharService availabilityPharService = Get.find();

  var signInController = Get.find<SignInController>();
  List<AvailabilityPhar> list1 = []; //全部avlP
  List<AvailabilityUser> list2 = []; //本用户的所有avlU
  List<Offer> listAllOffer = [];
  List<Demande> listAllDemande = [];

  var unReadMessage = 0.obs;

  Timer? _timer;

  EasyRefreshController _controller =
      EasyRefreshController(controlFinishRefresh: true);
  EasyRefreshController get controller => _controller;

  List<AvailabilityPhar> getList1() {
    //获取到所有和本avlU的日期匹配的avlP
    final newList = <AvailabilityPhar>[];
    for (final avlP in list1) {
      if (list2
          .where((element) =>
              element.date_month_year_candidate == avlP.date_month_year_phar)
          .isNotEmpty) {
        newList.add(avlP);
      }
    }
    return newList;
  }

  List<Offer> getMyOfferUser() {
    final newList = <Offer>[];
    for (final offer in listAllOffer) {
      if (list2
          .where((element) => element.avlUId == offer.avlU_id)
          .isNotEmpty) {
        newList.add(offer);
      }
    }
    return newList;
  }

  getMyDemandeUser() {
    final newList = <Demande>[];
    for (final demande in listAllDemande) {
      if (list2
          .where((element) => element.avlUId == demande.avlU_id)
          .isNotEmpty) {
        newList.add(demande);
      }
    }
    return newList;
  }

  setReadedAllDemandeUser() {
    for (final demande in listAllDemande) {
      //这里还要判断一下是不是和我的id一样
      if (demande.readed == 'NO' &&
          demande.user_avlU_id == signInController.user.userId) {
        demandeService.setReaded(demande.demande_id);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    // debugPrint('');
    ShowPharAvl();
    ShowMyAvl_User();
    ShowAllOfferUser();
    ShowAllDemande();
    _timer = Timer.periodic(1.seconds, (timer) {
      queryUnReadMessage();
    });
  }

  Future onRefresh() async {
    await ShowPharAvl();
    await ShowMyAvl_User();
    await ShowAllOfferUser();
    await ShowAllDemande();
  }

  void queryUnReadMessage() async {
    var response =
        await demandeService.getHowManyUnread(signInController.user.userId);
    unReadMessage.value = int.parse(response);
  }

  navigate(int i) {
    switch (i) {
      case 0:
        Get.toNamed(Routes.infos);
        break;
      case 1:
        //Get.toNamed(Routes.search);
        Get.toNamed(Routes.demande);

        unReadMessage = 0.obs;
        break;
      case 2:
        {
          if (signInController.user.userType == "candidat" ||
              signInController.user.userType == "etudiant") {
            //Get.toNamed(Routes.complexExemple);
            Get.toNamed(Routes.candidateAvailability);
          }
          if (signInController.user.userType == "recruteur") {
            //Get.toNamed(Routes.recruiterCalendar);
            Get.toNamed(Routes.complexExemple);
          }
        }

        break;
      case 3:
        {
          if (signInController.user.userType == "candidat" ||
              signInController.user.userType == "etudiant") {
            Get.toNamed(Routes.rDVFixeCandidate);
          }
          if (signInController.user.userType == "recruteur") {
            Get.toNamed(Routes.rDVFixeCandidate);
          }
        }
        break;
      default:
        Get.toNamed(Routes.my);
    }
  }

  Future ShowPharAvl() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await availabilityPharService.getInfos();
      manageResponse1(response);
    } on Error catch (e) {
      debugPrint('e: ${e.stackTrace}');
      HelperUtils.showSimpleSnackBar('Une erreur est survenue.');
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  manageResponse1(var response) {
    debugPrint('response: $response');
    if (response.toString().contains("error")) {
      HelperUtils.showSimpleSnackBar(response['error']);
      change(null, status: RxStatus.success());
      _controller.finishRefresh();
    } else {
      list1 =
          (response as List).map((e) => AvailabilityPhar.fromJson(e)).toList();
      change(null, status: RxStatus.success());
      update();
      _controller.finishRefresh();
    }
  }

  Future ShowMyAvl_User() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await availabilityUserService.getInfos();
      manageResponse2(response);
    } on Error catch (e) {
      debugPrint('e: ${e.stackTrace}');
      HelperUtils.showSimpleSnackBar('Une erreur est survenue.');
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  manageResponse2(var response) {
    debugPrint('response: $response');
    if (response.toString().contains("error")) {
      HelperUtils.showSimpleSnackBar(response['error']);
      change(null, status: RxStatus.success());
      _controller.finishRefresh();
    } else {
      list2 = (response as List)
          .map((e) => AvailabilityUser.fromJson(e))
          .where((element) => element.user_id == signInController.user.userId)
          .toList();
      change(null, status: RxStatus.success());
      update();
      _controller.finishRefresh();
    }
  }

  Future ShowAllOfferUser() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await offerService.getInfos();
      manageResponse3(response);
    } on Error catch (e) {
      debugPrint('e: ${e.stackTrace}');
      HelperUtils.showSimpleSnackBar('Une erreur est survenue.');
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  manageResponse3(var response) {
    debugPrint('response: $response');
    if (response.toString().contains("error")) {
      HelperUtils.showSimpleSnackBar(response['error']);
      change(null, status: RxStatus.success());
      _controller.finishRefresh();
    } else {
      listAllOffer = (response as List).map((e) => Offer.fromJson(e)).toList();
      change(null, status: RxStatus.success());
      update();
      _controller.finishRefresh();
    }
  }

  Future ShowAllDemande() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await demandeService.getInfos();
      manageResponse4(response);
    } on Error catch (e) {
      debugPrint('e: ${e.stackTrace}');
      HelperUtils.showSimpleSnackBar('Une erreur est survenue.');
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  manageResponse4(var response) {
    debugPrint('response: $response');
    if (response.toString().contains("error")) {
      HelperUtils.showSimpleSnackBar(response['error']);
      change(null, status: RxStatus.success());
      _controller.finishRefresh();
    } else {
      listAllDemande =
          (response as List).map((e) => Demande.fromJson(e)).toList();
      change(null, status: RxStatus.success());
      update();
      _controller.finishRefresh();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// class IconBtnWithCounter extends StatelessWidget {
//   const IconBtnWithCounter({
//     Key? key,
//     required this.svgSrc,
//     required this.num0fItems,
//     required this.press,
//   }) : super(key: key);

//   final String svgSrc;
//   final int num0fItems;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: press,
//       borderRadius: BorderRadius.circular(50),
//       child: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.all(getProportionateScreenWidth(12)),
//             height: getProportionateScreenWidth(46),
//             width: getProportionateScreenWidth(46),
//             decoration: BoxDecoration(
//                 color: const Color(0).withOpacity(0.2), shape: BoxShape.circle),
//             child: SvgPicture.asset(svgSrc),
//           ),
//           if (num0fItems != 0)
//             Positioned(
//               right: 0,
//               child: Container(
//                 height: getProportionateScreenWidth(16),
//                 width: getProportionateScreenHeight(16),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFF4848),
//                   shape: BoxShape.circle,
//                   border: Border.all(width: 1.5, color: Colors.white),
//                 ),
//                 child: Center(
//                     child: Text(
//                   "$num0fItems",
//                   style: TextStyle(
//                       fontSize: getProportionateScreenWidth(10),
//                       height: 1,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600),
//                 )),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: SizeConfig.screenWidth * 0.6, //60% of our width
//       decoration: BoxDecoration(
//           color: const Color(0x00000000).withOpacity(0.15),
//           borderRadius: BorderRadius.circular(15)),
//       child: TextField(
//         onChanged: (value) {
//           //search value
//         },
//         decoration: InputDecoration(
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           hintText: "Search ...",
//           prefixIcon: const Icon(Icons.search),
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(20),
//             vertical: getProportionateScreenWidth(12),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeHeader extends StatelessWidget {
//   const HomeHeader({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           SearchField(),
//         ],
//       ),
//     );
//   }
// }

// class NewsBanner extends StatelessWidget {
//   const NewsBanner({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin:
//             EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//         padding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(20),
//             vertical: getProportionateScreenWidth(15)),
//         width: double.infinity,
//         // height: 90,
//         decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 58, 183, 187),
//             borderRadius: BorderRadius.circular(20)),
//         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           const Text.rich(TextSpan(
//               text: "timeslot.date of pharmacy\ntype need\nadress\n",
//               style: TextStyle(color: Colors.white),
//               children: [
//                 TextSpan(
//                   text: "name of pharmacy",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 )
//               ])),
//           LikeButton(),
//           LikeButton(
//             likeBuilder: (bool isLiked) {
//               return Icon(
//                 Icons.hail,
//                 color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
//                 size: 35,
//               );
//             },
//           ),
//         ]));
//   }
// }
