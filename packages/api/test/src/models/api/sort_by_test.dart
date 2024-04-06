import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'SortBy.text:',
    () {
      test(
        'only type',
        () {
          final SortBy sortBy;

          sortBy = SortBy.text();

          expect(sortBy.queryParams.length, 1);
          expect(
            sortBy.queryParams.first,
            SortType.textMatch.value,
          );

          expect(
            sortBy.toQueryParameter().contains('&'),
            false,
          );
        },
      );

      test(
        'with asc',
        () {
          const direction = SortDirection.asc;
          final SortBy sortBy;

          sortBy = SortBy.text(
            direction: direction,
          );

          expect(sortBy.queryParams.length, 1);
          expect(
            sortBy.queryParams.first,
            '${SortType.textMatch.value}:${direction.name}',
          );
          expect(
            sortBy.toQueryParameter().contains('&'),
            false,
          );
        },
      );

      test(
        'with desc',
        () {
          const direction = SortDirection.desc;
          final SortBy sortBy;

          sortBy = SortBy.text(
            direction: direction,
          );

          expect(sortBy.queryParams.length, 1);
          expect(
            sortBy.queryParams.first,
            '${SortType.textMatch.value}:${direction.name}',
          );
          expect(
            sortBy.toQueryParameter().contains('&'),
            false,
          );
        },
      );
    },
  );

  group(
    'SortBy.sellingPrice',
    () {
      test(
        'only type',
        () {
          final SortBy sortBy;

          sortBy = SortBy.sellingPrice();

          expect(sortBy.queryParams.length, 1);
          expect(
            sortBy.queryParams.first,
            SortType.sellingPrice.value,
          );

          expect(
            sortBy.toQueryParameter().contains('&'),
            false,
          );
        },
      );

      test(
        'with asc',
        () {
          const direction = SortDirection.asc;
          final SortBy sortBy;

          sortBy = SortBy.sellingPrice(
            direction: direction,
          );

          expect(sortBy.queryParams.length, 1);
          expect(
            sortBy.queryParams.first,
            '${SortType.sellingPrice.value}:${direction.name}',
          );
          expect(
            sortBy.toQueryParameter().contains('&'),
            false,
          );
        },
      );

      test(
        'with desc',
        () {
          const direction = SortDirection.desc;
          final SortBy sortBy;

          sortBy = SortBy.sellingPrice(
            direction: direction,
          );

          expect(sortBy.queryParams.length, 1);
          expect(
            sortBy.queryParams.first,
            '${SortType.sellingPrice.value}:${direction.name}',
          );
          expect(
            sortBy.toQueryParameter().contains('&'),
            false,
          );
        },
      );
    },
  );

  group(
    'SortBy.sellingPriceMinMax',
    () {
      const min = 11.2;
      const max = 22.4;

      test(
        'only type',
        () {
          final SortBy sortBy;

          sortBy = SortBy.sellingPriceMinMax(
            minPrice: min,
            maxPrice: max,
          );

          expect(sortBy.queryParams.length, 3);
          expect(
            sortBy.queryParams.first,
            SortType.sellingPrice.value,
          );

          final toParameters = sortBy.toQueryParameter();

          expect(
            toParameters.contains('&'),
            true,
          );
        },
      );

      test(
        'with asc',
        () {
          const direction = SortDirection.asc;
          final SortBy sortBy;

          sortBy = SortBy.sellingPriceMinMax(
            direction: direction,
            minPrice: min,
            maxPrice: max,
          );

          expect(sortBy.queryParams.length, 3);
          expect(
            sortBy.queryParams.first,
            '${SortType.sellingPrice.value}:${direction.name}',
          );
          expect(
            sortBy.toQueryParameter().contains('&'),
            true,
          );
        },
      );

      test(
        'with desc',
        () {
          const direction = SortDirection.desc;
          final SortBy sortBy;

          sortBy = SortBy.sellingPriceMinMax(
            direction: direction,
            minPrice: min,
            maxPrice: max,
          );

          expect(sortBy.queryParams.length, 3);
          expect(
            sortBy.queryParams.first,
            '${SortType.sellingPrice.value}:${direction.name}',
          );
          expect(
            sortBy.toQueryParameter().contains('&'),
            true,
          );
        },
      );
    },
  );
}
