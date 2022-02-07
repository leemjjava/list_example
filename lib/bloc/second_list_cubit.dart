import 'package:flutter_bloc/flutter_bloc.dart';

class SecondListCubit extends Cubit<int> {
  List<String> list = [];
  SecondListCubit() : super(0);

  addItem(String title) {
    list.add(title);
    emit(list.length);
  }

  deleteItem(int index) {
    list.removeAt(index);
    emit(list.length);
  }
}
