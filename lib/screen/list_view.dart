import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view_example/bloc/LIstNotifier.dart';

// ignore: must_be_immutable
class PageListView extends StatelessWidget {
  int index;
  late String title;
  late List<String> list;
  late BuildContext context;

  PageListView({
    required this.index,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final listNotifier = context.watch<ListNotifier>();
    list = listNotifier.list[index];

    return Container(
      color: const Color(0xffcfcfcf),
      child: Column(
        children: [
          renderTopBar(),
          Expanded(child: renderListView()),
        ],
      ),
    );
  }

  Widget renderTopBar() {
    return Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(title),
    );
  }

  Widget renderListView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index >= list.length) return renderAddBtn();

        final title = "item ${index + 1}";
        return renderBtnItem(title, index);
      },
    );
  }

  Widget renderBtnItem(String title, int itemIndex) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          renderLeftBtn(itemIndex),
          Expanded(child: renderListItem(title)),
          renderRightBtn(itemIndex),
        ],
      ),
    );
  }

  Widget renderLeftBtn(int itemIndex) {
    if (index == 0) return Container();
    return InkWell(
      child: const Icon(Icons.arrow_back_ios),
      onTap: () => _onLeftBtnTap(itemIndex),
    );
  }

  Widget renderRightBtn(int itemIndex) {
    if (index == 3) return Container();
    return InkWell(
      child: const Icon(Icons.arrow_forward_ios),
      onTap: () => _onRightBtnTap(itemIndex),
    );
  }

  Widget renderListItem(String title) {
    return Container(
      width: 250,
      height: 40,
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(title),
    );
  }

  Widget renderAddBtn() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        child: renderListItem("+"),
        onTap: _addMyItem,
      ),
    );
  }

  _addMyItem() {
    final notifier = context.read<ListNotifier>();
    notifier.addItemList(index);
  }

  _onLeftBtnTap(int itemIndex) {
    final notifier = context.read<ListNotifier>();
    notifier.removeItem(index, itemIndex);
    notifier.addItemList(index - 1);
  }

  _onRightBtnTap(int itemIndex) {
    final notifier = context.read<ListNotifier>();
    notifier.removeItem(index, itemIndex);
    notifier.addItemList(index + 1);
  }
}
