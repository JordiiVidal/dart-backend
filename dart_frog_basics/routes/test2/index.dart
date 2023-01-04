import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final text = context.read<String>();
  return Response(body: text);
}
