import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(
        statusCode: HttpStatus.methodNotAllowed,
      );
  }
}

Future<Response> _get(RequestContext context) async {
  final provider = await context.read<Future<TodosDataSource>>();
  final todos = await provider.readAll();
  return Response.json(
    body: todos,
  );
}

Future<Response> _post(RequestContext context) async {
  final provider = await context.read<Future<TodosDataSource>>();
  final todo = Todo.fromJson(context.request.uri.queryParameters);
  return Response.json(
    statusCode: HttpStatus.created,
    body: await provider.create(todo),
  );
}
