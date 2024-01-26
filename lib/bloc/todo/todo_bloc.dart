
import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/todo/todo_event.dart';
import 'package:flutterbloc/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todosList = [];
  TodoBloc():super(TodoState()){
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);

  }
  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todosList.add(event.event);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.event);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}