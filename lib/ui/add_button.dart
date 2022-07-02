import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_liubice/state_management/counter.dart';

class AddButton extends ConsumerWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => incrementCounter(ref),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
