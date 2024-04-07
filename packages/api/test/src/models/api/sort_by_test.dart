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

          expect(
            sortBy.toQueryParameter().contains(':'),
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

          expect(
            sortBy.toQueryParameter().contains(':'),
            true,
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

          expect(
            sortBy.toQueryParameter().contains(':'),
            true,
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

          expect(
            sortBy.toQueryParameter().contains(':'),
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

          expect(
            sortBy.toQueryParameter().contains(':'),
            true,
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

          expect(
            sortBy.toQueryParameter().contains(':'),
            true,
          );
        },
      );
    },
  );
}
