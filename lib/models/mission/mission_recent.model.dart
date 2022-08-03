import 'dart:convert';

class MissionRecent {
  MissionRecent({
    this.misId,
    this.dateEnd,
    this.dateStart,
    this.timeEnd,
    this.timeStart,
    this.userId,
    this.phaId,
    this.phaAdrs,
    this.phaNom,
  });

  int? misId;
  String? dateEnd;
  String? dateStart;
  String? timeEnd;
  String? timeStart;
  int? userId;
  int? phaId;
  String? phaAdrs;
  String? phaNom;

  factory MissionRecent.fromJson(Map<String, dynamic> json) => MissionRecent(
        misId: json["mis_id"],
        dateEnd: json["date_end"],
        dateStart: json["date_start"],
        timeEnd: json["time_end"],
        timeStart: json["time_start"],
        userId: json["user_id"],
        phaId: json["pha_id"],
        phaAdrs: json["pha_Adrs"],
        phaNom: json["pha_Nom"],
      );

  Map<String, dynamic> toJson() => {
        "mis_id": misId,
        "date_end": dateEnd,
        "date_start": dateStart,
        "time_end": timeEnd,
        "time_start": timeStart,
        "user_id": userId,
        "pha_id": phaId,
        "pha_Adrs": phaAdrs,
        "pha_Nom": phaNom,
      };

  static List<MissionRecent> missionFromJson(String str) =>
      List<MissionRecent>.from(
          json.decode(str).map((x) => MissionRecent.fromJson(x)));

  static String missionToJson(List<MissionRecent> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
