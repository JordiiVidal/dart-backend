import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

void main() {
  final uri = Uri.parse('ws://localhost:8080/ws');
  final channel = WebSocketChannel.connect(uri);
  // Listen
  channel.stream.listen(print);
  // Send
  channel.sink.add('__increment__');
  channel.sink.add('__decrement__');
  // Close
  channel.sink.close();
}
