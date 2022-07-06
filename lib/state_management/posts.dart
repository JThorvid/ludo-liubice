import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/ui/post.dart';

final postsProvider = StateProvider<List<Post>>((ref) => [
      Post(postHeader: PostHeader("", "")),
    ]);

void updatePosts(WidgetRef ref, Future<List<Post>> futurePosts) async =>
    ref.read(postsProvider.state).state = await futurePosts;
