import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/external/article_page.dart';
import 'package:ludo_liubice/state_management/article.dart';
import 'package:ludo_liubice/data/article.dart';
import 'package:ludo_liubice/ui/circular_progress_indicator.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Article stateArticle = ref.watch(articleProvider);
    if (stateArticle.content == null) {
      updateArticle(ref, addContent(stateArticle));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          stateArticle.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        children: [
          if (stateArticle.image != null) stateArticle.image!,
          if (stateArticle.content != null) Html(data: stateArticle.content),
          if (stateArticle.content == null) const MyCircularProgressIndicator(),
        ],
      ),
    );
  }
}
