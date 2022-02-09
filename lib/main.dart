import 'package:flutter/material.dart';
import 'package:list_view_example/bloc/LIstNotifier.dart';
import 'package:list_view_example/screen/page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listNotifier = ListNotifier();
    listNotifier.setListLength(4);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PageScreen(notifier: listNotifier),
    );
  }
}
