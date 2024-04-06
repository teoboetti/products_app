import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'FacetCount',
    () {
      test(
        'fromJson',
        () {
          final json = {
            'field_name': 'merchant',
            'counts': [
              {
                'count': 4,
                'highlighted': 'sportnetitalia',
                'value': 'Sportnet',
              },
              {
                'count': 6,
                'highlighted': 'nonsolosport',
                'value': 'NonSoloSport',
              },
              {
                'count': 4,
                'highlighted': 'nencini sport',
                'value': 'Nencini Sport',
              },
              {
                'count': 1,
                'highlighted': 'dileocalzature',
                'value': 'Di Leo calzature',
              },
              {
                'count': 4,
                'highlighted': 'lineaorosport',
                'value': 'Lineaorosport',
              },
              {
                'count': 8,
                'highlighted':
                    'amazonitshoes,amazonitsportnoprime,amazonitsport',
                'value': 'Amazon',
              },
              {
                'count': 1,
                'highlighted': 'quellogiusto',
                'value': 'Quellogiusto',
              },
              {
                'count': 2,
                'highlighted': 'game7athletics',
                'value': 'Game7Athletics',
              }
            ],
            'stats': {
              'max': 159,
              'min': 13,
            },
          };

          final facetCount = FacetCount.fromJson(json);

          expect(facetCount.fieldName, equals('merchant'));
          expect(facetCount.counts.length, 8);
          expect(facetCount.stats, isNotEmpty);
        },
      );

      test(
        'toJson',
        () {
          const fieldName = 'example_field';
          final counts = <Count>[];
          final stats = {'min': 0, 'max': 10};
          final facetCount = FacetCount(
            fieldName: fieldName,
            counts: counts,
            stats: stats,
          );

          final json = facetCount.toJson();

          expect(json['field_name'], equals(fieldName));
          expect(
            json['counts'],
            equals([]),
          );
          expect(json['stats'], equals(stats));
        },
      );
    },
  );
}
