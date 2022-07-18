import 'dart:convert';

class Availability {
  Availability({
    this.avlId,
    this.dateEnd,
    this.dateStart,
    this.timeEnd,
    this.timeStart,
    this.userId,
  });

  int? avlId;
  String? dateEnd;
  String? dateStart;
  String? timeEnd;
  String? timeStart;
  int? userId;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        avlId: json["avl_id"],
        dateEnd: json["date_end"],
        dateStart: json["date_start"],
        timeEnd: json["time_end"],
        timeStart: json["time_start"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "avl_id": avlId,
        "date_end": dateEnd,
        "date_start": dateStart,
        "time_end": timeEnd,
        "time_start": timeStart,
        "user_id": userId,
      };

  static List<Availability> availabilityFromJson(String str) =>
      List<Availability>.from(
          json.decode(str).map((x) => Availability.fromJson(x)));

  static String availabilityToJson(List<Availability> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
