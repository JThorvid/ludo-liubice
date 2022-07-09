import 'package:flutter/material.dart';
import 'package:ludo_liubice/data/article.dart';
import 'package:ludo_liubice/state_management/article.dart';
import 'package:ludo_liubice/ui/article_page.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: getImageAndTitle(context),
      onTap: () => goToArticle(context, article),
    );
  }

  Widget getImageAndTitle(BuildContext context) {
    if (article.imageRatio != null) {
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
      article.title,
      style: Theme.of(context).textTheme.headline5,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: article.imageRatio!,
      child: article.image,
    );
  }
}

Future<void> goToArticle(BuildContext context, Article article) async {
  currentArticle = article;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ArticlePage()));
}
