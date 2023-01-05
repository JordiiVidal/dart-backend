import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final request = context.request;
  final method = request.method;
  if(method == HttpMethod.get){
     return Response(body: 'GET - TODOS');
  }
  if(method == HttpMethod.post){
    return Response(body: 'POST - TODOS');
  }
  return Response(body: 'No data');
}
