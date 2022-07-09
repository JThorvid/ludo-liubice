import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/assets/locale_keys.dart';
import 'package:ludo_liubice/data/article.dart';
import 'package:ludo_liubice/external/home_page.dart';
import 'package:ludo_liubice/state_management/home_page.dart';
import 'package:ludo_liubice/ui/circular_progress_indicator.dart';
import 'package:ludo_liubice/ui/article.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Article> articles = ref.watch(multipleArticlesProvider);
    if (articles.isEmpty) {
      updateMultipleArticles(ref, getHomePage());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title.tr()),
      ),
      body: ListView(
        children: [
          if (articles.isEmpty) const MyCircularProgressIndicator(),
          for (Article article in articles) ArticleWidget(article: article),
        ],
      ),
    );
  }
}
