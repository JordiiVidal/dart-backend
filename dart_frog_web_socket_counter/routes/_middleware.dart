import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket_counter/counter/middleware/counter_provider.dart';

Handler middleware(Handler handler) => handler.use(counterProvider);
