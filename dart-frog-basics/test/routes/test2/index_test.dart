import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/test2/_middleware.dart';
import '../../../routes/test2/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  group('middleware', () {
    test(
      'provider text',
      ()  async {
        // Arrange
        String? text;
        final handler = middleware((context) {
          text = context.read<String>();
          return Response(body: '');
        });
        final request = Request.get(Uri.parse('http://localhost:8080/test2'));
        final context = _MockRequestContext();
        when(() => context.request).thenReturn(request);

        // Act
        await handler(context);

        //Assert
        expect(text, equals('Hard'));
      },
    );
  });
  group('GET / ', () {
    test('Responds with a 200 and text', () async {
      // Arrange
      const text = 'Hard';
      final context = _MockRequestContext();
      when(() => context.read<String>()).thenReturn(text);

      //Act
      final response = route.onRequest(context);

      //Assert
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.body(), completion(equals(text)));
    });
  });
}
