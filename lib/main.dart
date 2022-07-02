import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/ui/app.dart';

final countProvider = StateProvider<int>((ref) => 0);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('de', 'DE')],
    path: 'assets/translations',
    startLocale: const Locale('de', 'DE'),
    fallbackLocale: const Locale('de', 'DE'),
    child: const ProviderScope(child: MyApp()),
  ));
}
