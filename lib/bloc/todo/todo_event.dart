import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  TodoEvent();

}
class AddTodoEvent extends TodoEvent {
  String event;
  AddTodoEvent({required this.event});

  @override
  List<Object?> get props => [];
}
class RemoveTodoEvent extends TodoEvent {
  Object event;
  RemoveTodoEvent({required this.event});

  @override
  List<Object?> get props => [];
}