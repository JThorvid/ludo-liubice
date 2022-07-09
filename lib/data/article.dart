import 'package:flutter/material.dart';

class Article {
  String title;
  String? content;
  String link;
  Image? image;
  double? imageRatio;

  Article({
    required ArticleHeader postHeader,
    ArticleImage? articleImage,
  })  : title = postHeader.title,
        link = postHeader.link,
        image = articleImage?.image,
        imageRatio = articleImage?.imageRatio;

  @override
  bool operator ==(covariant Article other) {
    bool titleEquals = title == other.title;
    bool linkEquals = link == other.link;
    bool ratioEquals = imageRatio == other.imageRatio;
    bool imageEquals = image.toString() == other.image.toString();
    return titleEquals && linkEquals && ratioEquals && imageEquals;
  }
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
