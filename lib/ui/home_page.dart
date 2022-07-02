import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ludo_liubice/assets/locale_keys.dart';
import 'package:ludo_liubice/ui/add_button.dart';
import 'package:ludo_liubice/ui/counter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Counter(),
          ],
        ),
      ),
      floatingActionButton: const AddButton(),
    );
  }
}
