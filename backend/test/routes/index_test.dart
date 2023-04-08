import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;

import 'package:test/test.dart';

void main() {
  group('Countries -', () {
    const endpoint = 'http://localhost:8080/api/v1';
    test('GET /api/v1/countries returns success', () async {
      final response = await http.get(Uri.parse('$endpoint/countries'));
      expect(response.statusCode, HttpStatus.ok);
      final method = HttpMethod.get.value;

      expect(
        response.body,
        equals('That is a $method. You are allowed to do this!'),
      );
    });

    test('POST /api/v1/countries not allowed', () async {
      final response = await http.post(Uri.parse('$endpoint/countries'));
      expect(response.statusCode, HttpStatus.methodNotAllowed);
      final method = HttpMethod.post.value;

      expect(
        response.body,
        equals('Sorry, you can not do $method overhere.'),
      );
    });
  });
}
