import 'package:dart_bloc/counter_cubit.dart';

void main() {
  final cubit = CounterCubit(1);
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.close();
}
