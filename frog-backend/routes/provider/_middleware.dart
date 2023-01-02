import 'package:dart_frog/dart_frog.dart';

int count = 0;
Handler middleware(Handler handler) {
  return handler.use(countProvider());
}

Middleware countProvider() {
  return provider<Future<int>>((context) async => add());
}

Future<int> add() async {
  return Future.value(++count);
}
