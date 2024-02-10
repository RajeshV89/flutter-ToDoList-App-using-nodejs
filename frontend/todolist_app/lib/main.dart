import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/data/respos/todolist_api.dart';
import 'package:todolist_app/presentation/bloc/getToDoListBloc/get_to_do_list_bloc.dart';
import 'package:todolist_app/presentation/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RepositoryProvider<ToDoListRepo>(
          create: (context) => ToDoListRepo(),
          child: BlocProvider(
            create: (context) => GetToDoListBloc(context.read<ToDoListRepo>())
              ..add(LoadToDoList()),
            child: const HomePage(),
          ),
        ),
      ),
    );
  }
}
