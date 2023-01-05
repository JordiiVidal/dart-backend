import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String id) {
  final request = context.request;
  final method = request.method;

  switch (method) {
    case HttpMethod.get:
      return Response();
    case HttpMethod.put:
      return Response();
    case HttpMethod.delete:
      return Response();
  }
  return Response();
}
