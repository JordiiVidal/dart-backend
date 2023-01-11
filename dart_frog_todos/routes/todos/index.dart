import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

Future<Response> onRequest(RequestContext context) async  {
  final request = context.request;
  final method = request.method;
  final data = await context.read<Future<TodosDataSource>>();
  if(method == HttpMethod.get){
    final todos = await data.readAll();
    return Response.json(body: todos);
  }
  if(method == HttpMethod.post){
    final todo = Todo(title: 'HOPE');
    await data.create(todo);
    return Response(body: 'POST - TODOS');
  }
  return Response(body: 'No data');
}
