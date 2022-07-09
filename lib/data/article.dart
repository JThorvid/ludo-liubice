import 'package:flutter/material.dart';

class Article {
  String title;
  String? content;
  String link;
  Image? image;
  double? imageRatio;

  Article({
    required ArticleHeader articleHeader,
    ArticleImage? articleImage,
  })  : title = articleHeader.title,
        link = articleHeader.link,
        image = articleImage?.image,
        imageRatio = articleImage?.imageRatio;

  Article.copy(Article article)
      : title = article.title,
        link = article.link,
        content = article.content,
        image = article.image,
        imageRatio = article.imageRatio;

  @override
  bool operator ==(covariant Article other) {
    bool titleEquals = title == other.title;
    bool linkEquals = link == other.link;
    bool ratioEquals = imageRatio == other.imageRatio;
    bool imageEquals = image.toString() == other.image.toString();
    bool contentEquals = content == other.content;
    return titleEquals &&
        linkEquals &&
        ratioEquals &&
        imageEquals &&
        contentEquals;
  }
}

class DummyArticle implements Article {
  @override
  String? content;

  @override
  Image? image;

  @override
  double? imageRatio;

  @override
  String link = "";

  @override
  String title = "";
}

class ArticleImage {
  Image image;
  double? imageRatio;

  ArticleImage({required this.image, this.imageRatio});

  @override
  bool operator ==(covariant ArticleImage other) {
    bool ratioEquals = imageRatio == other.imageRatio;
    bool imageEquals = image.toString() == other.image.toString();
    return ratioEquals && imageEquals;
  }
}

class ArticleHeader {
  String title;
  String link;

  ArticleHeader(this.title, this.link);

  @override
  bool operator ==(covariant ArticleHeader other) {
    bool titleEquals = title == other.title;
    bool linkEquals = link == other.link;
    return titleEquals && linkEquals;
  }
}
