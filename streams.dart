import 'dart:convert';
import 'dart:async';

// Single Subscription streams
StreamController<String> controller = StreamController<String>();
Stream<String> streamController = controller.stream;
// Broadcast streams
StreamController<String> controllerBroadcast =
    StreamController<String>.broadcast();
final Stream<String> streamBroadcast = controllerBroadcast.stream;

void main() async {
  const numSum = 10;
  int integer = suma(numSum);
  var stream = countStream(numSum);
  var sum = await sumStream(stream);
  print(integer);
  print(sum);
  streamController.listen((String data) {
    print(data);
  }, onError: (error) {
    print('Error : $error');
  }, onDone: () {
    print('Stream done');
  });
  streamBroadcast.listen((String data) {
    print(data);
  }, onError: (error) {
    print('Error : $error');
  }, onDone: () {
    print('Stream Broadcast done');
  });
  streamBroadcast.listen((String data) {
    print(data);
  }, onError: (error) {
    print('Error : $error');
  }, onDone: () {
    print('Stream Broadcast done');
  });
  controller.sink.add('Single - Subscription');
  controller.sink.addError('Error');
  controller.sink.close();
  controllerBroadcast.sink.add('Broadcast - Subscription');
  controller.sink.close();
}

suma(int value) {
  var sum = 10;
  return sum + value;
}

Stream<int> countStream(int to) async* {
  yield to; // Stream value
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 10;
  try {
    await for (final val in stream) {
      print(val);
      sum += val;
    }
  } catch (e) {
    return -1;
  }
  return sum;
}
