import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_bloc.dart';
import 'package:flutterbloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutterbloc/bloc/switch/switch_bloc.dart';
import 'package:flutterbloc/bloc/todo/todo_bloc.dart';
import 'package:flutterbloc/equitable.dart';
import 'package:flutterbloc/utils/image_picker_utils.dart';
import 'package:flutterbloc/view/Slider_Example.dart';
import 'package:flutterbloc/view/counter_view.dart';
import 'package:flutterbloc/view/image_picker_screen.dart';
import 'package:flutterbloc/view/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => TodoBloc()),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: TodoScreen(),
        ),
    );
  }
}

