import 'package:flutter_example/domain/entities/post_entity.dart';
import 'package:flutter_example/domain/repositories/post_repository.dart';

class PostUsecase {
  final PostRepository repository;

  PostUsecase({required this.repository});

  Future<List<PostEntity>> call() {
    return repository.getAllPosts();
  }
}
