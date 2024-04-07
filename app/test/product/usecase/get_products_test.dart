import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/repository/i_product_repository.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';

import '../../mocks/fake_sort_by.dart';

class MockProductRepository extends Mock implements IProductRepository {}

void main() {
  late MockProductRepository mockRepository;
  late GetProducts getProducts;

  setUpAll(
    () {
      registerFallbackValue(FakeSortBy());

      mockRepository = MockProductRepository();
      getProducts = GetProducts(
        repository: mockRepository,
      );
    },
  );

  group(
    'GetProducts:',
    () {
      test(
        'should return a list of products when called with valid parameters',
        () async {
          final products = List<Product>.generate(
            5,
            (i) => Product(
              id: '$i',
              image: 'image',
              title: 'title $i',
              description: 'description $i',
              url: 'url',
              listPrice: i + 1,
              sellingPrice: i + 2,
            ),
          );

          when(
            () => mockRepository.getProducts(
              query: any(named: 'query'),
              page: any(named: 'page'),
              perPage: any(named: 'perPage'),
              sortBy: any(named: 'sortBy'),
            ),
          ).thenAnswer(
            (_) async => products,
          );

          final result = await getProducts.call();

          expect(result, products);
        },
      );
    },
  );
}
