import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view_example/bloc/first_list_cubit.dart';
import 'package:list_view_example/bloc/fourth_list_cubit.dart';
import 'package:list_view_example/bloc/second_list_cubit.dart';
import 'package:list_view_example/bloc/third_list_cubit.dart';

// ignore: must_be_immutable
class PageListView extends StatelessWidget {
  int index;
  late String title;
  late List<String> list;
  late BuildContext context;

  PageListView({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    _watchCubit();

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

  _watchCubit() {
    switch (index) {
      case 0:
        list = context.watch<FirstListCubit>().list;
        title = "A";
        break;
      case 1:
        list = context.watch<SecondListCubit>().list;
        title = "B";
        break;
      case 2:
        list = context.watch<ThirdListCubit>().list;
        title = "C";
        break;
      case 3:
        list = context.watch<FourthListCubit>().list;
        title = "D";
        break;
    }
  }

  _addMyItem() {
    final addTitle = "Item ${list.length + 1}";
    switch (index) {
      case 0:
        context.read<FirstListCubit>().addItem(addTitle);
        break;
      case 1:
        context.read<SecondListCubit>().addItem(addTitle);
        break;
      case 2:
        context.read<ThirdListCubit>().addItem(addTitle);
        break;
      case 3:
        context.read<FourthListCubit>().addItem(addTitle);
        break;
    }
  }

  _onLeftBtnTap(int itemIndex) {
    switch (index) {
      case 1:
        context.read<SecondListCubit>().deleteItem(itemIndex);

        final list = context.read<FirstListCubit>().list;
        final addTitle = "Item ${list.length + 1}";
        context.read<FirstListCubit>().addItem(addTitle);
        break;
      case 2:
        context.read<ThirdListCubit>().deleteItem(itemIndex);

        final list = context.read<SecondListCubit>().list;
        final addTitle = "Item ${list.length + 1}";
        context.read<SecondListCubit>().addItem(addTitle);
        break;
      case 3:
        context.read<FourthListCubit>().deleteItem(itemIndex);

        final list = context.read<ThirdListCubit>().list;
        final addTitle = "Item ${list.length + 1}";
        context.read<ThirdListCubit>().addItem(addTitle);
        break;
    }
  }

  _onRightBtnTap(int itemIndex) {
    switch (index) {
      case 0:
        context.read<FirstListCubit>().deleteItem(itemIndex);

        final list = context.read<SecondListCubit>().list;
        final addTitle = "Item ${list.length + 1}";
        context.read<SecondListCubit>().addItem(addTitle);
        break;
      case 1:
        context.read<SecondListCubit>().deleteItem(itemIndex);

        final list = context.read<ThirdListCubit>().list;
        final addTitle = "Item ${list.length + 1}";
        context.read<ThirdListCubit>().addItem(addTitle);
        break;
      case 2:
        context.read<ThirdListCubit>().deleteItem(itemIndex);

        final list = context.read<FourthListCubit>().list;
        final addTitle = "Item ${list.length + 1}";
        context.read<FourthListCubit>().addItem(addTitle);
        break;
    }
  }
}
