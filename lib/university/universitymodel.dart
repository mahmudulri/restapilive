// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  UniversityModel({
    this.domains,
    this.alphaTwoCode,
    this.webPages,
    this.country,
    this.stateProvince,
    this.name,
  });

  List<String>? domains;
  String? alphaTwoCode;
  List<String>? webPages;
  String? country;
  String? stateProvince;
  String? name;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        domains: List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        country: json["country"],
        stateProvince:
            json["state-province"] == null ? null : json["state-province"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "domains": List<dynamic>.from(domains!.map((x) => x)),
        "alpha_two_code": alphaTwoCode,
        "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
        "country": country,
        "state-province": stateProvince == null ? null : stateProvince,
        "name": name,
      };
}

// enum AlphaTwoCode { US }

// final alphaTwoCodeValues = EnumValues({"US": AlphaTwoCode.US});

// enum Country { UNITED_STATES }

// final countryValues = EnumValues({"United States": Country.UNITED_STATES});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String>? get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
