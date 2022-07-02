import 'package:flutter_riverpod/flutter_riverpod.dart';

final countProvider = StateProvider<int>((ref) => 0);

int incrementCounter(WidgetRef ref) => ref.read(countProvider.state).state++;
