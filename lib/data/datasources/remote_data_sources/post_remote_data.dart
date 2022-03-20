import 'dart:convert';

import 'package:flutter_example/domain/entities/post_entity.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_example/data/models/post_model.dart';

import '../../../core/error/exceptions.dart';

abstract class PostRemoteDataSource {
  Future<List<PostEntity>> getGroups();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;
  final String url = "https://jsonplaceholder.typicode.com/posts";

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostEntity>> getGroups() async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PostEntity> posts =
          body.map((dynamic item) => PostModel.fromJson(item)).toList();
      return posts;
    } else {
      throw ServerException();
    }
  }
}
