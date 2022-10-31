import 'dart:convert';

AlleventsModel alleventsModelFromJson(String str) =>
    AlleventsModel.fromJson(json.decode(str));

String alleventsModelToJson(AlleventsModel data) => json.encode(data.toJson());

class AlleventsModel {
  AlleventsModel({
    this.status,
    this.allEvents,
  });

  int? status;
  List<AllEvent>? allEvents;

  factory AlleventsModel.fromJson(Map<String, dynamic> json) => AlleventsModel(
        status: json["status"],
        allEvents: List<AllEvent>.from(
            json["all_events"].map((x) => AllEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "all_events": List<dynamic>.from(allEvents!.map((x) => x.toJson())),
      };
}

class AllEvent {
  AllEvent({
    this.id,
    this.eventTypeId,
    this.eventTitle,
    this.postedBy,
    this.updatedBy,
    this.eventDescription,
    this.contactPerson,
    this.image,
    this.eventTime,
    this.eventDate,
    this.eventFee,
    this.priority,
    this.paymentType,
    this.showMobile,
    this.showDesktop,
    this.createdAt,
    this.updatedAt,
    this.eventTypeName,
    this.createdBy,
  });

  int? id;
  String? eventTypeId;
  String? eventTitle;
  String? postedBy;
  dynamic updatedBy;
  String? eventDescription;
  String? contactPerson;
  String? image;
  String? eventTime;
  String? eventDate;
  String? eventFee;
  String? priority;
  int? paymentType;
  int? showMobile;
  int? showDesktop;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? eventTypeName;
  dynamic createdBy;

  factory AllEvent.fromJson(Map<String, dynamic> json) => AllEvent(
        id: json["id"],
        eventTypeId: json["event_type_id"],
        eventTitle: json["event_title"],
        postedBy: json["posted_by"],
        updatedBy: json["updated_by"],
        eventDescription: json["event_description"],
        contactPerson: json["contact_person"],
        image: json["image"],
        eventTime: json["event_time"],
        eventDate: json["event_date"],
        eventFee: json["event_fee"] == null ? null : json["event_fee"],
        priority: json["priority"],
        paymentType: json["payment_type"],
        showMobile: json["showMobile"],
        showDesktop: json["showDesktop"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        eventTypeName: json["event_type_name"],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_type_id": eventTypeId,
        "event_title": eventTitle,
        "posted_by": postedBy,
        "updated_by": updatedBy,
        "event_description": eventDescription,
        "contact_person": contactPerson,
        "image": image,
        "event_time": eventTime,
        "event_date": eventDate,
        "event_fee": eventFee == null ? null : eventFee,
        "priority": priority,
        "payment_type": paymentType,
        "showMobile": showMobile,
        "showDesktop": showDesktop,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "event_type_name": eventTypeName,
        "created_by": createdBy,
      };
}
