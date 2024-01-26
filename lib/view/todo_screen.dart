import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/todo/todo_bloc.dart';
import 'package:flutterbloc/bloc/todo/todo_event.dart';
import 'package:flutterbloc/bloc/todo/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if(state.todosList.isEmpty) {
              return Center(
                child: Text("No item found"),
              );
            }
            return ListView.builder(
              itemCount: state.todosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todosList[index].toString()),
                    trailing: IconButton(
                      onPressed: (){
                        context.read<TodoBloc>().add(RemoveTodoEvent(event: state.todosList[index].toString()));
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                });
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String event = "Event";
          for(int i =0; i<10; i++){
            context.read<TodoBloc>().add(AddTodoEvent(event: "Event "+i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
