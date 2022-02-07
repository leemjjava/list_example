import 'package:flutter/material.dart';
import 'package:list_view_example/screen/list_view.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: renderPageView(),
      ),
    );
  }

  Widget renderPageView() {
    return PageView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return PageListView(index: index);
      },
      onPageChanged: (int index) {},
    );
  }
}
