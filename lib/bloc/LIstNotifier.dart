import 'package:flutter/cupertino.dart';

class ListNotifier extends ChangeNotifier {
  List<List<String>> list = [];

  setListLength(int length) {
    for (int i = 0; i < length; ++i) {
      list.add([]);
    }
  }

  addItemList(int index) {
    if (list.length <= index) return;

    final childList = list[index];
    final title = "item ${childList.length + 1}";
    childList.add(title);

    notifyListeners();
  }

  removeItem(int listIndex, int itemIndex) {
    if (list.length <= listIndex) return;

    final childList = list[listIndex];
    if (childList.length <= itemIndex) return;
    childList.removeAt(itemIndex);

    notifyListeners();
  }
}
