import 'package:flutter_example/data/datasources/remote_data_sources/post_remote_data.dart';
import 'package:flutter_example/domain/entities/post_entity.dart';
import 'package:flutter_example/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostEntity>> getAllPosts() async {
    return await remoteDataSource.getGroups();
  }
}
