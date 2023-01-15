import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:dart_frog_web_socket_counter/counter/cubit/counter_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    // A new client has connected to our server.
    final cubit = context.read<CounterCubit>()..subscribe(channel);
    // Send a message to the client.
    channel.sink.add('${cubit.state}');
    // Listen for messages from the client.
    channel.stream.listen(
      (event) {
        switch (event) {
          case '__increment__':
            cubit.increment();
            break;
          case '__decrement__':
            cubit.decrement();
            break;
          default:
            break;
        }
      },
      onDone: () => cubit.unsubscribe(channel),
    );
  });
  return handler(context);
}
