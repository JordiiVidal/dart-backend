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
      return Response(body: 'Not found');
  }
}

Future<Response> _get(RequestContext context) async {
  final provider = await context.read<Future<TodosDataSource>>();
  final todos = await provider.readAll();
  return Response.json(body: todos);
}

Future<Response> _post(RequestContext context) async {
  final provider = await context.read<Future<TodosDataSource>>();
  final params = context.request.uri.queryParameters;
  final todo = Todo(title: params['title'] ?? '');
  await provider.create(todo);
  return Response.json(body: todo);
}
