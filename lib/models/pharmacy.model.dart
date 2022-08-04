import 'dart:convert';

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
    phName: "selma",
    phPhone: "xin",
    phPhoneConf: 111111,
  ),
  Pharmacy(
    ownerId: 222222,
    phAddress: "2 rue de terra",
    phEmail: "email",
    phEmailConf: 222222,
    phId: 222222,
    phName: "selma",
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
    phName: "selma",
    phPhone: "xin",
    phPhoneConf: 333333,
  ),
  Pharmacy(
    ownerId: 222222,
    phAddress: "2 rue de terra",
    phEmail: "email",
    phEmailConf: 222222,
    phId: 222222,
    phName: "selma",
    phPhone: "xin",
    phPhoneConf: 222222,
  ),
  Pharmacy(
    ownerId: 333333,
    phAddress: "1 rue de terra",
    phEmail: "email",
    phEmailConf: 333333,
    phId: 333333,
    phName: "selma",
    phPhone: "xin",
    phPhoneConf: 333333,
  ),
];
