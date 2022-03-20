import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/presentation/posts/cubit/post_cubit.dart';
import 'package:flutter_example/presentation/posts/widgets/single_item_post_widget.dart';

class PostsPage extends StatefulWidget {
  final String? query;

  const PostsPage({Key? key, this.query}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/add-post");
          },
          child: const Text("+"),
        ),
        body: BlocBuilder<PostCubit, PostState>(
          builder: (context, postState) {
            if (postState is PostLoaded) {
              final posts = postState.posts.toList();
              return Column(
                children: [
                  Expanded(
                      child: posts.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "No posts Found yet",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.2)),
                                  )
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: posts.length,
                              itemBuilder: (_, index) {
                                return SingleItemPostWidget(
                                  post: posts[index],
                                );
                              },
                            ))
                ],
              );
            }
            return Container();
          },
        ));
  }
}
