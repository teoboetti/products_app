import 'package:api/src/models/catalog/count.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Count: ',
    () {
      test(
        'fromJson',
        () {
          final json = {
            'count': 3,
            'highlighted': '',
            'value': 'Moda > Scarpe > Scarpe Bambino',
          };

          final count = Count.fromJson(json);

          expect(count.count, equals(3));
          expect(count.highlighted, isEmpty);
          expect(count.value, isNotEmpty);
        },
      );

      test(
        'toJson',
        () {
          const count = Count(
            count: 1,
            highlighted: 'highlighted',
            value: 'value',
          );

          final json = count.toJson();

          expect(json['count'], count.count);
          expect(json['highlighted'], count.highlighted);
          expect(json['value'], count.value);
        },
      );
    },
  );
}
