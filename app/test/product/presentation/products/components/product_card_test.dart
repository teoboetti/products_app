import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/presentation/products/components/product_card.dart';

import '../../../../helpers/helpers.dart';

void main() {
  group(
    'ProductCard:',
    () {
      testWidgets(
        'should render product information',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          const product = Product(
            id: 'id',
            image: 'image',
            title: 'title',
            description: 'description',
            url: 'url',
            listPrice: 1,
            sellingPrice: 2,
            merchant: 'merchant',
          );

          await tester.pumpApp(
            const ProductCard(
              product: product,
            ),
          );

          expect(find.text(product.title), findsOneWidget);
          expect(find.text(product.merchant), findsOneWidget);
        },
      );
    },
  );
}
