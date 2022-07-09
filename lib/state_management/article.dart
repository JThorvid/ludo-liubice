import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/assets/locale_keys.dart';
import 'package:ludo_liubice/external/home_page.dart';
import 'package:ludo_liubice/data/article.dart';
import 'package:ludo_liubice/ui/circular_progress_indicator.dart';

final articleContentProvider = StateProvider.autoDispose<Widget>(
  (ref) => const MyCircularProgressIndicator(),
);

void addArticleContent(WidgetRef ref, Article article) async {
  try {
    article = await addContent(article);
    ref.read(articleContentProvider.state).state = Html(data: article.content);
  } catch (e) {
    ref.read(articleContentProvider.state).state = Text(
      "${LocaleKeys.standardError.tr()}: $e",
      style: const TextStyle(color: Colors.red),
    );
  }
}
