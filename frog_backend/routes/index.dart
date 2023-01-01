import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  bool respJson = [true, false].first;
  final request = context.request; //RequestContext
  final method = request.method.name; //POST, GET, DELETE ...
  final headers = request.headers;
  String host = headers['host'] ?? 'test'; //Map<String, String>
  final params = request.uri.queryParameters; //Map<String, String>
  String name = params['name'] ?? 'there';
  final body = await request.body();//The request body can only be read once.
  if(respJson) return Response.json(body: {'request_body': body});
  return Response(body: 'Welcome to Dart Frog! with in $method method');
}
