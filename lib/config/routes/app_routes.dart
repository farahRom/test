import 'package:flutter/material.dart';
import 'package:flutter_example/presentation/posts/pages/add_post_page.dart';
import 'package:flutter_example/presentation/posts/pages/posts_page.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(PostsPage());
      case '/add-post':
        return _materialRoute(AddPostPage());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
