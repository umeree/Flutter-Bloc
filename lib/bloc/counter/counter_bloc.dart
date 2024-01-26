
import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/counter/counter_event.dart';
import 'package:flutterbloc/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()){
    on<IncrementCounter>(_incrementCounter);
    on<DecrementCounter>(_decrementCounter);
  }
  void _incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }
  void _decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}