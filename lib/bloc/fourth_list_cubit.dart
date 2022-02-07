import 'package:flutter_bloc/flutter_bloc.dart';

class FourthListCubit extends Cubit<int> {
  List<String> list = [];
  FourthListCubit() : super(0);

  addItem(String title) {
    list.add(title);
    emit(list.length);
  }

  deleteItem(int index) {
    list.removeAt(index);
    emit(list.length);
  }
}
