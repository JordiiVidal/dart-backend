import 'package:dart_frog/dart_frog.dart';
import 'package:frog_backend/models/user.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final user = await _someFuture(id);
  return Response.json(
    body: {'user': user, 'id': id},
  );
}

Future<User> _someFuture(String id) {
  return Future<User>.value(User(name: 'Dash', email: 'dash@dash.com'));
}
