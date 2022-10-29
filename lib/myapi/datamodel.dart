// To parse this JSON data, do
//
//     final allnotesModel = allnotesModelFromJson(jsonString);

import 'dart:convert';

AllnotesModel allnotesModelFromJson(String str) =>
    AllnotesModel.fromJson(json.decode(str));

String allnotesModelToJson(AllnotesModel data) => json.encode(data.toJson());

class AllnotesModel {
  AllnotesModel({
    this.notes,
  });

  List<Note>? notes;

  factory AllnotesModel.fromJson(Map<String, dynamic> json) => AllnotesModel(
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes!.map((x) => x.toJson())),
      };
}

class Note {
  Note({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
