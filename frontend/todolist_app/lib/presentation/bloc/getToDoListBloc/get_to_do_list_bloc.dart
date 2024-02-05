import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/data/model/todolist_model.dart';
import 'package:todolist_app/data/respos/todolist_api.dart';

part 'get_to_do_list_event.dart';
part 'get_to_do_list_state.dart';

class GetToDoListBloc extends Bloc<GetToDoListEvent, GetToDoListState> {
  final ToDoListRepo _toDoListRepo;
  GetToDoListBloc(this._toDoListRepo) : super(GetToDoListInitialState()) {
    on<LoadToDoList>((event, emit) async {
      emit(GetToDoListLoadingState(_toDoListRepo));
      try {
        final toDoList = await _toDoListRepo.getToDoList();
        emit(GetToDoListSuccessState(todoList: toDoList));
      } catch (errorMessage) {
        emit(GetToDoListErrorState(errorMessage.toString()));
      }
    });
  }
}
