import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_event.dart';
import 'package:flutterbloc/bloc/counter/counter_state.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {

            return Text(state.counter.toString(), style: TextStyle(fontSize: 60),);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: Text("Increment"),
              ),
              SizedBox(width: 30,),
              ElevatedButton(
                onPressed: (){
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: Text("Decrement"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
