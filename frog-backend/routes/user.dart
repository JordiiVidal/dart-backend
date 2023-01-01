import 'package:dart_frog/dart_frog.dart';
import 'package:frog_backend/models/user.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    body: User(name: 'Dash', email: 'dash@dash.com'),
  );
}
