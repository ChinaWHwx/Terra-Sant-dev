import 'package:easy_refresh/easy_refresh.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/availabilityPhar.model.dart';
import 'package:flutter_application_1/models/availabilityUser.model.dart';
import 'package:flutter_application_1/models/demande.model.dart';
import 'package:flutter_application_1/models/offer.model.dart';
import 'package:flutter_application_1/modules/app/auth/SignIn/signin.controller.dart';
import 'package:flutter_application_1/models/ProductModel.dart';
import 'package:flutter_application_1/routes/app.pages.dart';
import 'package:flutter_application_1/services/availabilityPhar.service.dart';
import 'package:flutter_application_1/services/availabilityUser.service.dart';
import 'package:flutter_application_1/services/demande.service.dart';
import 'package:flutter_application_1/services/offer.service.dart';
import 'package:flutter_application_1/shared/utils/helper.utils.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class HomepageController extends GetxController with StateMixin {
  AvailabilityUserService availabilityUserService = Get.find();
  OfferService offerService = Get.find();
  DemandeService demandeService = Get.find();
  AvailabilityPharService availabilityPharService = Get.find();

  var signInController = Get.find<SignInController>();
  List<AvailabilityPhar> _list1 = []; //全部avlP
  List<AvailabilityUser> list2 = []; //本用户的所有avlU
  List<Offer> listAllOffer = [];
  List<Demande> listAllDemande = [];

  EasyRefreshController _controller =
      EasyRefreshController(controlFinishRefresh: true);
  EasyRefreshController get controller => _controller;

  List<AvailabilityPhar> getList1() {
    //获取到所有和本avlU的日期匹配的avlP
    final newList = <AvailabilityPhar>[];
    for (final avlP in _list1) {
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

  // List<AvailabilityUser> get list2 => _list2
  //     .where((element) => element.user_id == signInController.user.userId)
  //     .toList();
  @override
  void onInit() {
    super.onInit();
    // debugPrint('');
    ShowPharAvl();
    ShowAllOfferUser();
    ShowAllDemande();
  }

  navigate(int i) {
    switch (i) {
      case 0:
        Get.toNamed(Routes.infos);
        break;
      case 1:
        //Get.toNamed(Routes.search);
        Get.toNamed(Routes.demande);

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

  Future onRefresh() async {
    await ShowPharAvl();
    await ShowMyAvl_User();
    await ShowAllOfferUser();
    await ShowAllDemande();
  }

  manageResponse1(var response) {
    debugPrint('response: $response');
    if (response.toString().contains("error")) {
      HelperUtils.showSimpleSnackBar(response['error']);
      change(null, status: RxStatus.success());
      _controller.finishRefresh();
    } else {
      _list1 =
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
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    required this.num0fItems,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int num0fItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: const Color(0).withOpacity(0.2), shape: BoxShape.circle),
            child: SvgPicture.asset(svgSrc),
          ),
          if (num0fItems != 0)
            Positioned(
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenHeight(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                    child: Text(
                  "$num0fItems",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6, //60% of our width
      decoration: BoxDecoration(
          color: const Color(0x00000000).withOpacity(0.15),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onChanged: (value) {
          //search value
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search ...",
          prefixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(12),
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SearchField(),
        ],
      ),
    );
  }
}

class NewsBanner extends StatelessWidget {
  const NewsBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15)),
        width: double.infinity,
        // height: 90,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 58, 183, 187),
            borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Text.rich(TextSpan(
              text: "timeslot.date of pharmacy\ntype need\nadress\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: "name of pharmacy",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ])),
          // FavoriteButton(
          //   iconSize: getProportionateScreenWidth(20),
          //   valueChanged: (_isFavorite) {
          //     print('Is Favorite $_isFavorite)');
          //     //navigateToFavorite();
          //   },
          // ),
          LikeButton(),
          LikeButton(
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.hail,
                color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                size: 35,
              );
            },
          ),
        ]));
  }
}

// class Categories extends StatelessWidget {
//   const Categories({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> categories = [
//       {"icon": "assets/icons/homme.svg", "text": "falsh deal"},
//       {"icon": "assets/icons/homme.svg", "text": "falsh deal"},
//       {"icon": "assets/icons/homme.svg", "text": "falsh deal"},
//       {"icon": "assets/icons/homme.svg", "text": "falsh deal"},
//       {"icon": "assets/icons/homme.svg", "text": "falsh deal"},
//     ];
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ...List.generate(
//               categories.length,
//               (index) => CategoriesCard(
//                   icon: categories[index]["icon"],
//                   text: categories[index]["text"],
//                   press: () {}))
//         ],
//       ),
//     );
//   }
// }

// class CategoriesCard extends StatelessWidget {
//   const CategoriesCard({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.press,
//   }) : super(key: key);

//   final String icon, text;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: SizedBox(
//         width: getProportionateScreenWidth(55),
//         child: Column(
//           children: [
//             AspectRatio(
//               aspectRatio: 1,
//               child: Container(
//                 padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 41, 193, 213),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: SvgPicture.asset(icon),
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               text,
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SectionTitle extends StatelessWidget {
//   const SectionTitle({
//     Key? key,
//     required this.text,
//     required this.press,
//   }) : super(key: key);

//   final String text;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: getProportionateScreenWidth(18),
//               color: const Color.fromARGB(255, 26, 148, 242),
//             ),
//           ),
//           GestureDetector(
//             onTap: press,
//             child: const Text("see More"),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SpecialOfferCard extends StatelessWidget {
//   const SpecialOfferCard({
//     Key? key,
//     required this.category,
//     required this.image,
//     required this.numOfBrands,
//     required this.press,
//   }) : super(key: key);

//   final String category, image;
//   final int numOfBrands;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
//       child: SizedBox(
//         width: getProportionateScreenWidth(242),
//         height: getProportionateScreenWidth(100),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Stack(
//             children: [
//               Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                       const Color(0xFF343434).withOpacity(0.4),
//                       const Color(0xFF343434).withOpacity(0.15)
//                     ])),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: getProportionateScreenWidth(15),
//                     vertical: getProportionateScreenWidth(10)),
//                 child: Text.rich(
//                   TextSpan(
//                       style: const TextStyle(color: Colors.white),
//                       children: [
//                         TextSpan(
//                             text: category,
//                             style: TextStyle(
//                               fontSize: getProportionateScreenWidth(18),
//                               fontWeight: FontWeight.bold,
//                             )),
//                         TextSpan(text: "$numOfBrands Brands"),
//                       ]),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SpecialOffers extends StatelessWidget {
//   const SpecialOffers({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SectionTitle(
//           text: "Terra Terra Terra",
//           press: () {},
//         ),
//         SizedBox(height: getProportionateScreenWidth(20)),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               SpecialOfferCard(
//                 image: "assets/images/logo.png",
//                 category: "Selma Xiangyu Xin\n ",
//                 numOfBrands: 3,
//                 press: () {},
//               ),
//               SpecialOfferCard(
//                 image: "assets/images/logo.png",
//                 category: "Selma Xiangyu Xin\n ",
//                 numOfBrands: 3,
//                 press: () {},
//               ),
//               SizedBox(
//                 width: getProportionateScreenWidth(20),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//     this.width = 140,
//     this.aspectRetio = 1.02,
//     required this.product,
//   }) : super(key: key);

//   final double width, aspectRetio;
//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
//       child: SizedBox(
//         width: getProportionateScreenWidth(width),
//         child: Column(
//           children: [
//             AspectRatio(
//               aspectRatio: aspectRetio,
//               child: Container(
//                 padding: EdgeInsets.all(getProportionateScreenWidth(20)),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Image.asset(product.images[0]),
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               product.title,
//               style: const TextStyle(color: Colors.black),
//               maxLines: 2,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   product.price,
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 InkWell(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Container(
//                       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//                       width: getProportionateScreenWidth(35),
//                       height: getProportionateScreenWidth(35),
//                       decoration: BoxDecoration(
//                         color: product.isFavourite
//                             ? Colors.black.withOpacity(0.15)
//                             : Colors.black.withOpacity(0.1),
//                         shape: BoxShape.circle,
//                       ),
//                       child: FavoriteButton(
//                         iconSize: getProportionateScreenWidth(8),
//                         valueChanged: (_isFavorite) {
//                           print('Is Favorite $_isFavorite)');
//                           //navigateToFavorite();
//                         },
//                       )),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PopularProducts extends StatelessWidget {
//   const PopularProducts({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SectionTitle(text: "new information", press: () {}),
//         SizedBox(height: getProportionateScreenWidth(20)),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(children: [
//             ...List.generate(
//               demoProducts.length,
//               (index) => ProductCard(
//                 product: demoProducts[index],
//               ),
//             ),
//             SizedBox(
//               width: getProportionateScreenWidth(20),
//             )
//           ]),
//         ),
//       ],
//     );
//   }
// }
