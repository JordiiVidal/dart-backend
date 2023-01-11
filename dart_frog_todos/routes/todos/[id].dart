import 'dart:html';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context, id);
    case HttpMethod.post:
      return _post(context, id);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context, String id) async {
  final provider = await context.read<Future<TodosDataSource>>();
  return Response.json(
    body: await provider.read(id),
  );
}

Future<Response> _post(RequestContext context, String id) async {
  final provider = await context.read<Future<TodosDataSource>>();
  //TODO UPDATE
  return Response.json(
    body: await provider.read(id),
  );
}
