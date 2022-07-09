import 'package:flutter/material.dart';
import 'package:ludo_liubice/data/post.dart';
import 'package:ludo_liubice/ui/article.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: getImageAndTitle(),
      onTap: () => goToArticle(context, post),
    );
  }

  Widget getImageAndTitle() {
    if (post.imageRatio != null) {
      return Column(
        children: [
          AspectRatio(
            aspectRatio: post.imageRatio!,
            child: post.image,
          ),
          Text(post.title),
        ],
      );
    } else {
      return Text(post.title);
    }
  }
}

Future<void> goToArticle(BuildContext context, Post post) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ArticlePage(article: post)));
}
