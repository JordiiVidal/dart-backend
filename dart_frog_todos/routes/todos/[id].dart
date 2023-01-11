import 'dart:html';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final provider = await context.read<Future<TodosDataSource>>();
  final todo = await provider.read(id);

  if (todo == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  switch (context.request.method) {
    case HttpMethod.get:
      return _get(todo);
    case HttpMethod.put:
      return _put(context, todo);
    case HttpMethod.delete:
      return _delete(context, id);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(Todo todo) async {
  return Response.json(body: todo);
}

Future<Response> _put(RequestContext context, Todo todo) async {
  //TODO UPDATE
  return Response.json(
    body: todo,
  );
}

Future<Response> _delete(RequestContext context, String id) async {
  final dataSource = context.read<TodosDataSource>();
  await dataSource.delete(id);
  return Response.json(statusCode: HttpStatus.noContent);
}
