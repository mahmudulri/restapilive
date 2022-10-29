import 'dart:convert';

AlljobPostModel AlljobPostModelFromJson(String str) =>
    AlljobPostModel.fromJson(json.decode(str));

String AlljobPostModelToJson(AlljobPostModel data) =>
    json.encode(data.toJson());

class AlljobPostModel {
  AlljobPostModel({
    this.status,
    this.totalPosts,
    this.totalActivePosts,
    this.totalPendingPosts,
    this.posts,
  });

  int? status;
  int? totalPosts;
  int? totalActivePosts;
  int? totalPendingPosts;
  List<Post>? posts;

  factory AlljobPostModel.fromJson(Map<String, dynamic> json) =>
      AlljobPostModel(
        status: json["status"],
        totalPosts: json["total_posts"],
        totalActivePosts: json["total_active_posts"],
        totalPendingPosts: json["total_pending_posts"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "total_posts": totalPosts,
        "total_active_posts": totalActivePosts,
        "total_pending_posts": totalPendingPosts,
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    this.id,
    this.postTitle,
    this.postType,
    this.postDescription,
    this.image,
    this.postedBy,
    this.date,
    this.isPublished,
    this.isArchived,
    this.tag,
    this.createdAt,
    this.updatedAt,
    this.typeName,
    this.createdBy,
    this.mappingUser,
  });

  dynamic id;
  String? postTitle;
  String? postType;
  String? postDescription;
  String? image;
  String? postedBy;
  String? date;
  int? isPublished;
  int? isArchived;
  String? tag;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic typeName;
  dynamic createdBy;
  dynamic mappingUser;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        postTitle: json["post_title"],
        postType: json["post_type"],
        postDescription: json["post_description"],
        image: json["image"],
        postedBy: json["posted_by"],
        date: json["date"],
        isPublished: json["isPublished"],
        isArchived: json["isArchived"],
        tag: json["tag"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        typeName: json["type_name"],
        createdBy: json["created_by"],
        mappingUser: json["mapping_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_title": postTitle,
        "post_type": postType,
        "post_description": postDescription,
        "image": image,
        "posted_by": postedBy,
        "date": date,
        "isPublished": isPublished,
        "isArchived": isArchived,
        "tag": tag,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "type_name": typeName,
        "created_by": createdBy,
        "mapping_user": mappingUser,
      };
}
