import 'package:flutter/material.dart';
import 'package:flutter_example/domain/entities/post_entity.dart';

class SingleItemPostWidget extends StatelessWidget {
  final PostEntity post;
  const SingleItemPostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${post.title}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${post.body}",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            thickness: 1.50,
          ),
        ),
      ],
    );
  }
}
