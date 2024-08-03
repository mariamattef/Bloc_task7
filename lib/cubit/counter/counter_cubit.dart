import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_flutter/cubit/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));
  void increment() => emit(CounterState(state.count + 1));
  void decrement() => emit(CounterState(state.count - 1));
}
