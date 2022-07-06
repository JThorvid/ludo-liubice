import 'package:flutter/material.dart';
import 'package:html/dom.dart' as html;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:ludo_liubice/ui/post.dart';

Future<List<Post>> getHomePage() async {
  var url = Uri.parse('https://www.ludo-liubice.de/');
  var response = await http.post(url);
  if (response.statusCode == 200) {
    return getPosts(response.body);
  }
  return [];
}

List<Post> getPosts(String body) {
  List<Post> posts = [];
  html.Document doc = parse(body);
  List htmlPosts = doc.getElementsByClassName("post-content");
  for (html.Element element in htmlPosts) {
    PostImage? postImage = getImage(element);
    PostHeader? header = getHeader(element);
    if (header != null) {
      posts.add(Post(postHeader: header, postImage: postImage));
    }
  }
  return posts;
}

PostHeader? getHeader(html.Element element) {
  try {
    html.Element header = element.getElementsByClassName("entry-header")[0];
    html.Element text = header.getElementsByClassName("screen-reader-text")[0];
    List<html.Element> links = header.getElementsByTagName("a");
    Map<Object, String> linkAttributes = links[0].attributes;
    return PostHeader(text.text, linkAttributes["href"]!);
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
      return _createImage(imageAttributes);
    }
  } catch (e) {
    return null;
  }
  return null;
}

PostImage? _createImage(Map<Object, String> imageAttributes) {
  try {
    Image image = Image.network(imageAttributes["src"]!);
    double? imageRatio;
    if (imageAttributes["height"] != null && imageAttributes["width"] != null) {
      imageRatio = double.parse(imageAttributes["width"]!) /
          double.parse(imageAttributes["height"]!);
    }
    return PostImage(image: image, imageRatio: imageRatio);
  } catch (e) {
    return null;
    // couldn't parse image
  }
}
