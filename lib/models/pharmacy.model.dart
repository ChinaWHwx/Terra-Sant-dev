import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/utils/theme.utils.dart';
import 'package:like_button/like_button.dart';

Pharmacy pharmacyFromJson(String str) => Pharmacy.fromJson(json.decode(str));

String pharmacyToJson(Pharmacy data) => json.encode(data.toJson());

class Pharmacy {
  Pharmacy({
    required this.ownerId,
    required this.phAddress,
    required this.phEmail,
    required this.phEmailConf,
    required this.phId,
    required this.phName,
    required this.phPhone,
    required this.phPhoneConf,
  });

  int ownerId;
  String phAddress;
  String phEmail;
  int phEmailConf;
  int phId;
  String phName;
  String phPhone;
  int phPhoneConf;

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        ownerId: json["owner_id"],
        phAddress: json["ph_address"],
        phEmail: json["ph_email"],
        phEmailConf: json["ph_email_conf"],
        phId: json["ph_id"],
        phName: json["ph_name"],
        phPhone: json["ph_phone"],
        phPhoneConf: json["ph_phone_conf"],
      );

  Map<String, dynamic> toJson() => {
        "owner_id": ownerId,
        "ph_address": phAddress,
        "ph_email": phEmail,
        "ph_email_conf": phEmailConf,
        "ph_id": phId,
        "ph_name": phName,
        "ph_phone": phPhone,
        "ph_phone_conf": phPhoneConf,
      };
}

// Our demo Pharmacies
List<Pharmacy> demoPharmacies = [
  Pharmacy(
    ownerId: 111111,
    phAddress: "1 rue de terra",
    phEmail: "email",
    phEmailConf: 111111,
    phId: 111111,
    phName: "Pharma",
    phPhone: "xin",
    phPhoneConf: 111111,
  ),
  Pharmacy(
    ownerId: 222222,
    phAddress: "2 rue de terra",
    phEmail: "email",
    phEmailConf: 222222,
    phId: 222222,
    phName: "selma1",
    phPhone: "xin",
    phPhoneConf: 222222,
  ),
  Pharmacy(
    ownerId: 333333,
    phAddress:
        "1 rue de terraue de terraue de terra de terraue de terraue de terra de terraue de terraue de terra de terraue de terraue de terra de terraue de terraue de terra de terraue de terraue de terra de terraue de terraue de terra de terraue de terraue de terra",
    phEmail: "email",
    phEmailConf: 333333,
    phId: 333333,
    phName: "selma2",
    phPhone: "xin",
    phPhoneConf: 333333,
  ),
  Pharmacy(
    ownerId: 222222,
    phAddress: "2 rue de terra",
    phEmail: "email",
    phEmailConf: 222222,
    phId: 222222,
    phName: "selma3",
    phPhone: "xin",
    phPhoneConf: 222222,
  ),
  Pharmacy(
    ownerId: 333333,
    phAddress: "1 rue de terra",
    phEmail: "email",
    phEmailConf: 333333,
    phId: 333333,
    phName: "selma4",
    phPhone: "xin",
    phPhoneConf: 333333,
  ),
];

class Pharmacies extends StatelessWidget {
  const Pharmacies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              demoPharmacies.length,
              (index) => PharmaciesCard(
                    pharmacy: demoPharmacies[index],
                  ))
        ],
      ),
    );
  }
}

class PharmaciesCard extends StatelessWidget {
  const PharmaciesCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.pharmacy,
  }) : super(key: key);

  final double width, aspectRetio;
  final Pharmacy pharmacy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: SizedBox(
        // width: getProportionateScreenWidth(width),
        child: Card(
          color: const Color(0xFFA3FBF2),
          child: Column(
            children: [
              const SizedBox(
                width: 400,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              Text(
                "Nom de pharmacie: " + pharmacy.phName,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "Adresse: " + pharmacy.phAddress,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              // Text(
              //   "Tel: " + pharmacy.phPhone,
              //   style: const TextStyle(color: Colors.black, fontSize: 18),
              //   maxLines: 2,
              // ),
              // Text(
              //   "Nom de responsable: " + pharmacy.phName,
              //   style: const TextStyle(color: Colors.black, fontSize: 18),
              //   maxLines: 2,
              // ),
              SizedBox(height: getProportionateScreenWidth(30)),
              LikeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
