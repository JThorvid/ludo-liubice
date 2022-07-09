import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/data/post.dart';

final multiplePostsProvider = StateProvider<List<Post>>((ref) => []);

void updateMultiplePosts(WidgetRef ref, Future<List<Post>> futurePosts) async =>
    ref.read(multiplePostsProvider.state).state = await futurePosts;
