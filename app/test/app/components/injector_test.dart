import 'package:api/api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/app/components/injector.dart';
import 'package:products_app/product/data/product_repository.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';

void main() {
  group(
    'Injector:',
    () {
      testWidgets(
        'should provide all necessary dependencies',
        (tester) async {
          await tester.pumpWidget(
            const Injector(
              child: SizedBox(),
            ),
          );

          expect(
            find.byType(MultiRepositoryProvider),
            findsOneWidget,
          );

          expect(
            find.byType(RepositoryProvider<CatalogApi>),
            findsOneWidget,
          );

          expect(
            find.byType(RepositoryProvider<ProductRepository>),
            findsOneWidget,
          );

          expect(
            find.byType(RepositoryProvider<GetProducts>),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should render child widget',
        (tester) async {
          await tester.pumpWidget(
            const Injector(
              child: SizedBox(),
            ),
          );

          expect(find.byType(SizedBox), findsOneWidget);
        },
      );
    },
  );
}
