// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.totalDepartments,
    this.department,
  });

  int? status;
  int? totalDepartments;
  List<Department>? department;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        totalDepartments: json["total_departments"],
        department: List<Department>.from(
            json["department"].map((x) => Department.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_departments": totalDepartments,
        "department": List<dynamic>.from(department!.map((x) => x.toJson())),
      };

  userAsStringByName() {}
}

class Department {
  Department({
    this.id,
    this.departmentName,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? departmentName;
  dynamic createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        departmentName: json["department_name"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "department_name": departmentName,
        "created_by": createdBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
