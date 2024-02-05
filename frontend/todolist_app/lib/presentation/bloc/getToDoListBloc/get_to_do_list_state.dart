part of 'get_to_do_list_bloc.dart';

sealed class GetToDoListState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetToDoListInitialState extends GetToDoListState {}

final class GetToDoListLoadingState extends GetToDoListState {
  final ToDoListRepo toDoListRepo;
  GetToDoListLoadingState(this.toDoListRepo);

  @override
  List<Object?> get props => [toDoListRepo];
}

final class GetToDoListSuccessState extends GetToDoListState {
  final List<TodoListModel> todoList;

  GetToDoListSuccessState({required this.todoList});

  @override
  List<Object?> get props => [todoList];
}

final class GetToDoListErrorState extends GetToDoListState {
  final String errorMessage;
  GetToDoListErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
