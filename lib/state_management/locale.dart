import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider<Locale>((ref) => const Locale('de', 'DE'));

void switchLocale(WidgetRef ref, Locale locale) =>
    ref.read(localeProvider.state).state = locale;
