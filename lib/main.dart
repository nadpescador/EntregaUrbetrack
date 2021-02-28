import 'package:ejercicio_urbetrack/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:ejercicio_urbetrack/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
