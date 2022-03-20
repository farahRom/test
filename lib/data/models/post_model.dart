import 'package:flutter_example/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    final int userId = 0,
    final int id = 0,
    final String title = "",
    final String body = "",
  }) : super(userId: userId, id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: (json["userId"] as num).toInt(),
      id: (json["id"] as num).toInt(),
      title: json["title"],
      body: json["body"],
    );
  }
}
