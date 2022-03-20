import 'package:flutter_example/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAllPosts();
}
