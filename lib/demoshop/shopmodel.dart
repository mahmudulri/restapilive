// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

ShopModel? shopModelFromJson(String str) =>
    ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel? data) => json.encode(data!.toJson());

class ShopModel {
  ShopModel({
    this.sys,
    this.total,
    this.skip,
    this.limit,
    this.items,
  });

  ShopModelSys? sys;
  int? total;
  int? skip;
  int? limit;
  List<Item?>? items;

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        sys: ShopModelSys.fromJson(json["sys"]),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
        items: json["items"] == null
            ? []
            : List<Item?>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sys": sys!.toJson(),
        "total": total,
        "skip": skip,
        "limit": limit,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x!.toJson())),
      };
}

class Item {
  Item({
    this.metadata,
    this.sys,
    this.fields,
  });

  Metadata? metadata;
  ItemSys? sys;
  Fields? fields;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        metadata: Metadata.fromJson(json["metadata"]),
        sys: ItemSys.fromJson(json["sys"]),
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata!.toJson(),
        "sys": sys!.toJson(),
        "fields": fields!.toJson(),
      };
}

class Fields {
  Fields({
    this.productName,
    this.productCategory,
  });

  String? productName;
  String? productCategory;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        productName: json["productName"],
        productCategory: json["productCategory"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productCategory": productCategory,
      };
}

class Metadata {
  Metadata({
    this.tags,
  });

  List<dynamic>? tags;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class ItemSys {
  ItemSys({
    this.space,
    this.id,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.environment,
    this.revision,
    this.contentType,
    this.locale,
  });

  ContentType? space;
  String? id;
  FluffyType? type;
  DateTime? createdAt;
  DateTime? updatedAt;
  ContentType? environment;
  int? revision;
  ContentType? contentType;
  Locale? locale;

  factory ItemSys.fromJson(Map<String, dynamic> json) => ItemSys(
        space: ContentType.fromJson(json["space"]),
        id: json["id"],
        type: fluffyTypeValues!.map[json["type"]],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        environment: ContentType.fromJson(json["environment"]),
        revision: json["revision"],
        contentType: ContentType.fromJson(json["contentType"]),
        locale: localeValues!.map[json["locale"]],
      );

  Map<String, dynamic> toJson() => {
        "space": space!.toJson(),
        "id": id,
        "type": fluffyTypeValues.reverse![type],
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "environment": environment!.toJson(),
        "revision": revision,
        "contentType": contentType!.toJson(),
        "locale": localeValues.reverse![locale],
      };
}

class ContentType {
  ContentType({
    this.sys,
  });

  ContentTypeSys? sys;

  factory ContentType.fromJson(Map<String, dynamic> json) => ContentType(
        sys: ContentTypeSys.fromJson(json["sys"]),
      );

  Map<String, dynamic> toJson() => {
        "sys": sys!.toJson(),
      };
}

class ContentTypeSys {
  ContentTypeSys({
    this.type,
    this.linkType,
    this.id,
  });

  PurpleType? type;
  LinkType? linkType;
  Id? id;

  factory ContentTypeSys.fromJson(Map<String, dynamic> json) => ContentTypeSys(
        type: purpleTypeValues!.map[json["type"]],
        linkType: linkTypeValues!.map[json["linkType"]],
        id: idValues!.map[json["id"]],
      );

  Map<String, dynamic> toJson() => {
        "type": purpleTypeValues.reverse![type],
        "linkType": linkTypeValues.reverse![linkType],
        "id": idValues.reverse![id],
      };
}

enum Id { DEMOSHOP, MASTER, FCSFQJPV7_IUR }

final idValues = EnumValues({
  "demoshop": Id.DEMOSHOP,
  "fcsfqjpv7iur": Id.FCSFQJPV7_IUR,
  "master": Id.MASTER
});

enum LinkType { CONTENT_TYPE, ENVIRONMENT, SPACE }

final linkTypeValues = EnumValues({
  "ContentType": LinkType.CONTENT_TYPE,
  "Environment": LinkType.ENVIRONMENT,
  "Space": LinkType.SPACE
});

enum PurpleType { LINK }

final purpleTypeValues = EnumValues({"Link": PurpleType.LINK});

enum Locale { EN_US }

final localeValues = EnumValues({"en-US": Locale.EN_US});

enum FluffyType { ENTRY }

final fluffyTypeValues = EnumValues({"Entry": FluffyType.ENTRY});

class ShopModelSys {
  ShopModelSys({
    this.type,
  });

  String? type;

  factory ShopModelSys.fromJson(Map<String, dynamic> json) => ShopModelSys(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
