import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request; //RequestContext
  final method = request.method.name; //POST, GET, DELETE ...
  dynamic body;

  //Headers
  final headers = request.headers;
  final contentType = headers['content-type'] ?? 'test'; //Map<String, String>

  //Params
  final params = request.uri.queryParameters; //Map<String, String>
  //final name = params['name'] ?? 'there';

  switch (contentType) {
    case 'application/x-www-form-urlencoded':
      body = await request.formData();
      break;
    default:
      body = await request.body(); //The request body can only be read once.
      break;
  }

  return Response.json(
    statusCode: 204, //Default 200
    body: {
      'request_body': body,
      'params': params,
      'method': method,
      headers: {'hello': 'world'}
    },
  );
}
