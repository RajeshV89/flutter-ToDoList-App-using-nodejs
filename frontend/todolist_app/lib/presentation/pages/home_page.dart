import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/presentation/bloc/getToDoListBloc/get_to_do_list_bloc.dart';
import 'package:todolist_app/presentation/widgets/homepage/homepage_list_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi there,'),
        centerTitle: false,
        backgroundColor: Colors.black54,
      ),
      body: BlocBuilder<GetToDoListBloc, GetToDoListState>(
          builder: (context, state) {
        if (state is GetToDoListInitialState) {
          return const Center(child: Text('Initial State'));
        } else if (state is GetToDoListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetToDoListSuccessState) {
          print(state.todoList);
          return HomePageListTile(toDoListData: state.todoList);
        } else if (state is GetToDoListErrorState) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('Unknown State'));
        }
      }),
    );
  }
}
