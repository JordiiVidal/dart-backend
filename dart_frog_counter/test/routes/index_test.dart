import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/_middleware.dart';
import '../../routes/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  group('middleware', () {
    test('Provider count', () async {
      // Arrange
      int? count;
      final handler = middleware((context) {
        count = context.read<int>();
        return Response(body: '');
      });
      final request = Request.get(Uri.parse('http://localhost:8080/'));
      final context = _MockRequestContext();
      when(() => context.request).thenReturn(request);

      // Act
      await handler(context);

      // Assert
      expect(count, equals(1));
    });
  });
  group('GET /', () {
    test('responds with a 200 and count.', () {
      // Arrange
      const count = 1;
      final context = _MockRequestContext();
      when(() => context.read<int>()).thenReturn(count);

      // Act
      final response = route.onRequest(context);

      // Assert (Afirmación)
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.body(), completion(equals('Count : $count')));
    });
  });
}
