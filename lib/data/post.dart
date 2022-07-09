import 'package:flutter/material.dart';

class Post {
  String title;
  String? content;
  String link;
  Image? image;
  double? imageRatio;

  Post({
    required PostHeader postHeader,
    PostImage? postImage,
  })  : title = postHeader.title,
        link = postHeader.link,
        image = postImage?.image,
        imageRatio = postImage?.imageRatio;

  @override
  bool operator ==(covariant Post other) {
    bool titleEquals = title == other.title;
    bool linkEquals = link == other.link;
    bool ratioEquals = imageRatio == other.imageRatio;
    bool imageEquals = image.toString() == other.image.toString();
    return titleEquals && linkEquals && ratioEquals && imageEquals;
  }
}

class PostImage {
  Image image;
  double? imageRatio;

  PostImage({required this.image, this.imageRatio});

  @override
  bool operator ==(covariant PostImage other) {
    bool ratioEquals = imageRatio == other.imageRatio;
    bool imageEquals = image.toString() == other.image.toString();
    return ratioEquals && imageEquals;
  }
}

class PostHeader {
  String title;
  String link;

  PostHeader(this.title, this.link);

  @override
  bool operator ==(covariant PostHeader other) {
    bool titleEquals = title == other.title;
    bool linkEquals = link == other.link;
    return titleEquals && linkEquals;
  }
}
