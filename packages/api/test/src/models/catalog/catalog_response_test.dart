import 'package:api/src/models/catalog/catalog_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Catalog Response:',
    () {
      test(
        'fromJson',
        () {
          final json = {
            'page': 1,
            'found': 10,
            'source': 'example',
            'facet_counts': <Map<String, dynamic>>[],
            'grouped_hits': <Map<String, dynamic>>[],
          };

          final catalogResponse = CatalogResponse.fromJson(json);

          expect(catalogResponse.page, equals(1));
          expect(catalogResponse.found, equals(10));
          expect(catalogResponse.source, equals('example'));
          expect(catalogResponse.facetCounts, isEmpty);
          expect(catalogResponse.groupedHits, isEmpty);
        },
      );

      test(
        'toJson',
        () {
          const catalogResponse = CatalogResponse(
            page: 1,
            found: 20,
            source: '',
            facetCounts: [],
            groupedHits: [],
          );

          final json = catalogResponse.toJson();

          expect(json['page'], equals(catalogResponse.page));
          expect(json['found'], equals(catalogResponse.found));
          expect(json['source'], equals(catalogResponse.source));
          expect(json['facet_counts'], equals(catalogResponse.facetCounts));
          expect(json['grouped_hits'], equals(catalogResponse.groupedHits));
        },
      );
    },
  );
}
