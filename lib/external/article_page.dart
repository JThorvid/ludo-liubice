import 'package:ludo_liubice/data/article.dart';
import 'package:html/dom.dart' as html;
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

Future<Article> addContent(Article article) async {
  if (article.link.isNotEmpty) {
    var url = Uri.parse(article.link);
    var response = await http.post(url);
    if (response.statusCode == 200) {
      addResponse(response.body, article);
    }
  }
  return article;
}

void addResponse(String body, Article article) {
  html.Document doc = parse(body);
  html.Element content = doc.getElementsByClassName("entry-content")[0];
  article.content = content.innerHtml
      .split("<div class=\"sharedaddy sd-sharing-enabled\">")[0];
}
