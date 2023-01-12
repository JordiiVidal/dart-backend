import 'dart:async';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {

  final handler = webSocketHandler((channel, protocol) {
    channel.stream.listen((event) {
      // Handle incoming client messages
      print(event);
    });

    // Send a message back to the client.
    channel.sink.add('hi from server');
  });
  return handler(context);
}

// Only managing WebSocket
// Handler get onRequest {
//   return webSocketHandler((channel, protocol) {
//     channel.stream.listen((event) {
//       print(event);
//     });

//     channel.sink.add('Hi from server');
//   });
// }
