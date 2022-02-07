import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view_example/bloc/second_list_cubit.dart';
import 'package:list_view_example/screen/page_screen.dart';
import 'bloc/first_list_cubit.dart';
import 'bloc/fourth_list_cubit.dart';
import 'bloc/third_list_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirstListCubit>(create: (_) => FirstListCubit()),
        BlocProvider<SecondListCubit>(create: (_) => SecondListCubit()),
        BlocProvider<ThirdListCubit>(create: (_) => ThirdListCubit()),
        BlocProvider<FourthListCubit>(create: (_) => FourthListCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PageScreen(),
      ),
    );
  }
}
