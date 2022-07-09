import 'package:flutter/material.dart';
import 'package:ludo_liubice/data/post.dart';
import 'package:ludo_liubice/ui/article.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: getImageAndTitle(context),
      onTap: () => goToArticle(context, post),
    );
  }

  Widget getImageAndTitle(BuildContext context) {
    if (post.imageRatio != null) {
      return Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          _buildTitle(context),
          const Padding(padding: EdgeInsets.all(2)),
          _buildImage(),
        ],
      );
    } else {
      return _buildTitle(context);
    }
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      post.title,
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: post.imageRatio!,
      child: post.image,
    );
  }
}

Future<void> goToArticle(BuildContext context, Post post) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ArticlePage(article: post)));
}
