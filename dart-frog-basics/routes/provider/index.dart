import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final count = await context.read<Future<int>>();
  return Response(
    body: count.toString(),
  );
}
