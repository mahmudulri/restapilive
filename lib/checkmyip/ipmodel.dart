// To parse this JSON data, do
//
//     final myipModel = myipModelFromJson(jsonString);

import 'dart:convert';

MyipModel myipModelFromJson(String str) => MyipModel.fromJson(json.decode(str));

String myipModelToJson(MyipModel data) => json.encode(data.toJson());

class MyipModel {
  MyipModel({
    this.ip,
    this.city,
    this.region,
    this.country,
    this.loc,
    this.org,
    this.postal,
    this.timezone,
    this.readme,
  });

  String? ip;
  String? city;
  String? region;
  String? country;
  String? loc;
  String? org;
  String? postal;
  String? timezone;
  String? readme;

  factory MyipModel.fromJson(Map<String, dynamic> json) => MyipModel(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
        readme: json["readme"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "city": city,
        "region": region,
        "country": country,
        "loc": loc,
        "org": org,
        "postal": postal,
        "timezone": timezone,
        "readme": readme,
      };
}
