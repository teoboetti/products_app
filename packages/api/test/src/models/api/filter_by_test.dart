import 'package:api/src/models/api/filter_by.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'FilterBy:',
    () {
      test(
        'instance',
        () {
          const filterBy = FilterBy(
            minPrice: 1,
            maxPrice: 12,
          );

          expect(filterBy, isNotNull);
        },
      );
    },
  );
}
