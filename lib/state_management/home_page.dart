import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/data/article.dart';

final multipleArticlesProvider = StateProvider<List<Article>>((ref) => []);

void updateMultipleArticles(
        WidgetRef ref, Future<List<Article>> futureArticles) async =>
    ref.read(multipleArticlesProvider.state).state = await futureArticles;
