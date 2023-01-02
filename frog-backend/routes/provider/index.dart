import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final count = await context.readAsync();
  return Response(
    body: count.toString(),
  );
}

extension ReadAsync on RequestContext {
  Future<int> readAsync<int extends Object>() => read<Future<int>>();
}
