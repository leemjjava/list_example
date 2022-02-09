import 'package:flutter/material.dart';
import 'package:list_view_example/bloc/LIstNotifier.dart';
import 'package:list_view_example/screen/list_view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PageScreen extends StatelessWidget {
  ListNotifier notifier;

  PageScreen({
    Key? key,
    required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => notifier,
      child: Scaffold(
        body: SafeArea(
          child: renderPageView(),
        ),
      ),
    );
  }

  Widget renderPageView() {
    return PageView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        final title = _getTitle(index);
        return PageListView(
          index: index,
          title: title,
        );
      },
      onPageChanged: (int index) {},
    );
  }

  _getTitle(int index) {
    switch (index) {
      case 0:
        return "A";
      case 1:
        return "B";
      case 2:
        return "C";
      case 3:
        return "D";
    }
  }
}
