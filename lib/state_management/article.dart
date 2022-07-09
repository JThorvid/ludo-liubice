import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/assets/locale_keys.dart';
import 'package:ludo_liubice/external/home_page.dart';
import 'package:ludo_liubice/data/post.dart';
import 'package:ludo_liubice/ui/circular_progress_indicator.dart';

final postContentProvider = StateProvider.autoDispose<Widget>(
  (ref) => const MyCircularProgressIndicator(),
);

void addPostContent(WidgetRef ref, Post post) async {
  try {
    post = await addContent(post);
    ref.read(postContentProvider.state).state = Html(data: post.content);
  } catch (e) {
    ref.read(postContentProvider.state).state = Text(
      "${LocaleKeys.standardError.tr()}: $e",
      style: const TextStyle(color: Colors.red),
    );
  }
}
