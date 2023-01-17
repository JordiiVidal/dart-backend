import 'package:dart_bloc/counter_cubit.dart';
import 'package:bloc/bloc.dart';
import './lib/bloc_observer.dart';
import './lib/counter_bloc.dart';

void main() async {
  //Cubit
  Bloc.observer = MyBlocObserver();
  final cubit = CounterCubit(1);
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.close();
  //Bloc
  final bloc = CounterBloc();
  print(bloc.state); //0
  bloc.add(CounterIncrementPressed());
  print(bloc.state); //0
  /// Wait for next iteration of the event-loop
  /// to ensure event has been processed.
  await Future.delayed(Duration.zero);
  print(bloc.state); //1
  await bloc.close();
}
