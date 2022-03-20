import 'package:flutter_example/data/datasources/remote_data_sources/post_remote_data.dart';
import 'package:flutter_example/data/repositories/post_repository_impl.dart';
import 'package:flutter_example/domain/usecases/post_usecase.dart';
import 'package:flutter_example/presentation/posts/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'domain/repositories/post_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<PostCubit>(() => PostCubit(
        postUsecase: sl.call(),
      ));
  sl.registerLazySingleton<PostUsecase>(
      () => PostUsecase(repository: sl.call()));
  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl.call()));
  sl.registerLazySingleton(() => http.Client());
}
