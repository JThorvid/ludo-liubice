import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class Post {
  String title;
  Image? image;
  double? imageRatio;

  Post({
    required this.title,
    PostImage? postImage,
  })  : image = postImage?.image,
        imageRatio = postImage?.imageRatio;

  @override
  bool operator ==(covariant Post other) {
    bool titleEquals = title == other.title;
    bool ratioEquals = imageRatio == other.imageRatio;
    bool imageEquals = image.toString() == other.image.toString();
    return titleEquals && ratioEquals && imageEquals;
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
