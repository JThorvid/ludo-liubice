import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/assets/locale_keys.dart';
import 'package:ludo_liubice/external/website.dart';
import 'package:ludo_liubice/state_management/posts.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Post> posts = ref.watch(postsProvider);
    updatePosts(ref, getHomePage());

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title.tr()),
      ),
      body: ListView(
        children: [
          for (Post post in posts) PostWidget(post: post),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.imageRatio != null) {
      return Column(
        children: [
          AspectRatio(
            aspectRatio: post.imageRatio!,
            child: post.image,
          ),
          Text(post.title),
        ],
      );
    } else {
      return Text(post.title);
    }
  }
}
