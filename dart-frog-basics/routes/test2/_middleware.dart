import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(testProvider());
}

Middleware testProvider() {
  return provider<String>((_) => 'Hard');
}
