import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_example/domain/entities/post_entity.dart';
import 'package:flutter_example/domain/usecases/post_usecase.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostUsecase postUsecase;

  PostCubit({required this.postUsecase}) : super(PostInitial());

  void getGroups() {
    postUsecase.repository
        .getAllPosts()
        .then((posts) => {emit(PostLoaded(posts: posts))});
  }
}
