import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

void main() {
  final uri = Uri.parse('ws://localhost:8080/ws_example');
  final channel = WebSocketChannel.connect(uri);
  channel.stream.listen((event) {
    print(event);
  });
  channel.sink.add('hi from client');
}
