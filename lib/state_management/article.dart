import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/data/article.dart';

Article currentArticle = DummyArticle();

final articleProvider =
    StateProvider.autoDispose<Article>((ref) => currentArticle);

void updateArticle(WidgetRef ref, Future<Article> futureArticle) async {
  ref.read(articleProvider.state).state = Article.copy(await futureArticle);
}
