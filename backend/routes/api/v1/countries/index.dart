import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final method = context.request.method.value;

  if (method == HttpMethod.get.value) {
    return Response(
      body: 'That is a $method. You are allowed to do this!',
    );
  }
  return Response(
    body: 'Sorry, you can not do $method overhere.',
    statusCode: HttpStatus.methodNotAllowed,
  );
}
