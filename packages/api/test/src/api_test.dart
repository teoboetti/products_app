import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/dio.dart';
import '../mocks/uri.dart';

void main() {
  late MockDio mockDio;
  late CatalogApi catalogApi;

  setUpAll(() {
    registerFallbackValue(FakeUri());
    mockDio = MockDio();
    catalogApi = CatalogApi(client: mockDio);
  });

  group(
    'CatalogApi: ',
    () {
      test(
        'can be instantiated',
        () {
          expect(
            catalogApi,
            isNotNull,
          );
        },
      );

      test(
        'should handle null response',
        () async {
          when(() => mockDio.getUri<Map<String, dynamic>>(any())).thenAnswer(
            (_) async => MockResponse(),
          );

          final result = catalogApi.getCatalog();

          expect(result, throwsArgumentError);
          verify(() => mockDio.getUri<Map<String, dynamic>>(any())).called(1);
        },
      );

      test(
        'should throw is dio client throws error',
        () {
          final expectedError = DioException(
            requestOptions: RequestOptions(),
          );

          when(
            () => mockDio.getUri<Map<String, dynamic>>(
              any(),
            ),
          ).thenThrow(
            expectedError,
          );

          final result = catalogApi.getCatalog();

          expect(result, throwsA(expectedError));
          verify(() => mockDio.getUri<Map<String, dynamic>>(any())).called(1);
        },
      );

      test(
        'should retrieve catalog data with default parameters',
        () async {
          const expectedResponse = CatalogResponse(
            page: 1,
            found: 30,
            source: 'source',
            facetCounts: [],
            groupedHits: [],
          );

          final mockResponse = MockResponse<Map<String, dynamic>>(
            data: expectedResponse.toJson(),
          );

          when(
            () => mockDio.getUri<Map<String, dynamic>>(
              any(),
            ),
          ).thenAnswer((_) async => mockResponse);

          final result = await catalogApi.getCatalog();

          expect(result, isA<CatalogResponse>());
          verify(
            () => mockDio.getUri<Map<String, dynamic>>(
              any(),
            ),
          ).called(1);
        },
      );

      test('should retrieve catalog data with custom parameters', () async {
        const expectedResponse = CatalogResponse(
          page: 1,
          found: 30,
          source: 'source',
          facetCounts: [],
          groupedHits: [],
        );

        final mockResponse = MockResponse<Map<String, dynamic>>(
          data: expectedResponse.toJson(),
        );

        when(
          () => mockDio.getUri<Map<String, dynamic>>(
            any(),
          ),
        ).thenAnswer((_) async => mockResponse);

        final result = await catalogApi.getCatalog(
          query: 'nike',
          sortBy: SortBy.text(),
        );

        expect(result, isA<CatalogResponse>());
        verify(
          () => mockDio.getUri<Map<String, dynamic>>(
            any(),
          ),
        ).called(1);
      });
    },
  );
}
