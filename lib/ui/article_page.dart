import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/state_management/article.dart';
import 'package:ludo_liubice/data/article.dart';

class ArticlePage extends ConsumerWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postContent = ref.watch(articleContentProvider);
    if (article.content == null) {
      addArticleContent(ref, article);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        children: [
          if (article.image != null) article.image!,
          postContent,
        ],
      ),
    );
  }
}
