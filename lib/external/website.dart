import 'package:flutter/material.dart';
import 'package:html/dom.dart' as html;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<List<Post>> getHomePage() async {
  var url = Uri.parse('https://www.ludo-liubice.de/');
  var response = await http.post(url);
  if (response.statusCode == 200) {
    return processHTML(response.body);
  }
  return [];
}

List<Post> processHTML(String body) {
  List<Post> posts = [];
  html.Document doc = parse(body);
  List htmlPosts = doc.getElementsByClassName("post-content");
  for (html.Element element in htmlPosts) {
    //List<html.Element> links = images[0].getElementsByTagName("a");
    PostImage? postImage = getImage(element);
    String? title = getTitle(element);
    if (title != null) {
      posts.add(Post(title: title, postImage: postImage));
    }
  }
  return posts;
}

String? getTitle(html.Element element) {
  try {
    html.Element header = element.getElementsByClassName("entry-header")[0];
    html.Element text = header.getElementsByClassName("screen-reader-text")[0];
    return text.text;
  } catch (e) {
    return null;
  }
}

PostImage? getImage(html.Element element) {
  try {
    html.Element htmlImage =
        element.getElementsByClassName("featured-image")[0];
    html.Element imageLink = htmlImage.getElementsByTagName("img")[0];
    Map<Object, String> imageAttributes = imageLink.attributes;
    if (imageAttributes["src"] != null) {
      try {
        Image image = Image.network(imageAttributes["src"]!);
        double? imageRatio;
        if (imageAttributes["height"] != null &&
            imageAttributes["width"] != null) {
          imageRatio = double.parse(imageAttributes["width"]!) /
              double.parse(imageAttributes["height"]!);
        }
        return PostImage(image: image, imageRatio: imageRatio);
      } catch (e) {
        return null;
        // couldn't parse image
      }
    }
  } catch (e) {
    return null;
  }
  return null;
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
}

class PostImage {
  Image image;
  double? imageRatio;

  PostImage({required this.image, this.imageRatio});
}
