import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_app/product/data/product_repository.dart';
import 'package:products_app/product/domain/entity/product.dart';

import '../../mocks/fake_filter_by.dart';
import '../../mocks/fake_sort_by.dart';

class MockCatalogApi extends Mock implements CatalogApi {}

void main() {
  late MockCatalogApi mockCatalogApi;
  late ProductRepository productRepository;

  setUpAll(
    () {
      registerFallbackValue(FakeSortBy());
      registerFallbackValue(FakeFilterBy());

      mockCatalogApi = MockCatalogApi();
      productRepository = ProductRepository(api: mockCatalogApi);
    },
  );

  group(
    'ProductRepository:',
    () {
      test(
        'should return a list of products when the API call is successful',
        () async {
          final expectedResult = [
            const Product(
              id: '1',
              image: 'image1',
              title: 'Product 1',
              description: 'Description 1',
              url: 'url1',
              listPrice: 10,
              sellingPrice: 8,
              merchant: '',
            ),
            const Product(
              id: '2',
              image: 'image2',
              title: 'Product 2',
              description: 'Description 2',
              url: 'url2',
              listPrice: 20,
              sellingPrice: 15,
              merchant: '',
            ),
          ];

          when(
            () => mockCatalogApi.getCatalog(
              query: any<String>(named: 'query'),
              page: any<int>(named: 'page'),
              perPage: any<int>(named: 'perPage'),
              sortBy: any<SortBy>(named: 'sortBy'),
              filterBy: any<FilterBy>(named: 'filterBy'),
            ),
          ).thenAnswer(
            (_) async => const CatalogResponse(
              page: 1,
              found: 2,
              source: 'source',
              facetCounts: [],
              groupedHits: [
                GroupedHit(
                  hits: [
                    Hit(
                      document: Document(
                        id: '1',
                        image: 'image1',
                        title: 'Product 1',
                        description: 'Description 1',
                        url: 'url1',
                        listPrice: 10,
                        sellingPrice: 8,
                        affiliateUrl: '',
                        brand: '',
                        category1: '',
                        category2: '',
                        category: '',
                        discountPercentage: 1,
                        hasImage: 1,
                        imageMerchant: '',
                        merchant: '',
                        merchantID: '',
                        newOffer: false,
                        tags: [],
                      ),
                    ),
                    Hit(
                      document: Document(
                        id: '2',
                        image: 'image2',
                        title: 'Product 2',
                        description: 'Description 2',
                        url: 'url2',
                        listPrice: 20,
                        sellingPrice: 15,
                        affiliateUrl: '',
                        brand: '',
                        category1: '',
                        category2: '',
                        category: '',
                        discountPercentage: 1,
                        hasImage: 1,
                        imageMerchant: '',
                        merchant: '',
                        merchantID: '',
                        newOffer: false,
                        tags: [],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );

          final result = await productRepository.getProducts();

          expect(result, expectedResult);
        },
      );

      test(
        'should return empty list if found 0',
        () async {
          when(
            () => mockCatalogApi.getCatalog(
              query: any<String>(named: 'query'),
              page: any<int>(named: 'page'),
              perPage: any<int>(named: 'perPage'),
              sortBy: any<SortBy>(named: 'sortBy'),
              filterBy: any<FilterBy>(named: 'filterBy'),
            ),
          ).thenAnswer(
            (_) async => const CatalogResponse(
              page: 1,
              found: 0,
              source: 'source',
              facetCounts: [],
              groupedHits: [],
            ),
          );

          final result = await productRepository.getProducts();

          expect(result, isEmpty);
        },
      );
    },
  );
}
