// ignore_for_file: prefer_const_constructors

import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/dio.dart';

void main() {
  late MockDio mockDio;

  setUpAll(() {
    mockDio = MockDio();
  });

  group(
    'Api',
    () {
      test(
        'can be instantiated',
        () {
          expect(
            CatalogApi(client: mockDio),
            isNotNull,
          );
        },
      );
    },
  );
}
