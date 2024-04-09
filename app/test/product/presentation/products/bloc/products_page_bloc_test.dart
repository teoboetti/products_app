import 'package:api/api.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';
import 'package:products_app/product/presentation/products/bloc/products_page_bloc.dart';

class MockGetProducts extends Mock implements GetProducts {}

void main() {
  late MockGetProducts getProducts;
  late ProductsPageBloc bloc;
  late Product product;
  late Exception? exception;

  setUpAll(
    () {
      getProducts = MockGetProducts();
      bloc = ProductsPageBloc(
        getProducts: getProducts,
      );
      product = const Product(
        id: 'id',
        image: 'image',
        title: 'title',
        description: 'description',
        url: 'url',
        listPrice: 1,
        sellingPrice: 1,
        merchant: 'merchant',
      );
    },
  );

  group(
    'ProductsPageBloc:',
    () {
      test(
        'should init with initial state',
        () {
          expect(bloc.state, isA<ProductsPageInitial>());
        },
      );

      group(
        'Search',
        () {
          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoading, ProductsPageEmptySearch] '
            'when ProductSearchEvent return empty products',
            setUp: () {
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenAnswer(
                (_) async => [],
              );
            },
            build: () => ProductsPageBloc(getProducts: getProducts),
            act: (bloc) => bloc.add(
              const ProductSearchEvent(
                query: 'query',
              ),
            ),
            expect: () => const <ProductsPageState>[
              ProductsPageLoading(),
              ProductsPageEmptySearch(),
            ],
          );

          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoading, ProductsPageLoaded] '
            'when ProductSearchEvent return products',
            setUp: () {
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenAnswer(
                (_) async => [
                  product,
                ],
              );
            },
            build: () => ProductsPageBloc(getProducts: getProducts),
            act: (bloc) => bloc.add(
              const ProductSearchEvent(
                query: 'query',
              ),
            ),
            expect: () => [
              const ProductsPageLoading(),
              ProductsPageLoaded(
                products: [product],
              ),
            ],
          );

          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoading, ProductsPageLoaded] '
            'when ProductSearchEvent throws',
            setUp: () {
              exception = Exception();
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenThrow(exception!);
            },
            build: () => ProductsPageBloc(
              getProducts: getProducts,
            ),
            act: (bloc) => bloc.add(
              const ProductSearchEvent(
                query: 'query',
              ),
            ),
            expect: () => <ProductsPageState>[
              const ProductsPageLoading(),
              ProductsPageLoaded(
                products: const [],
                error: exception,
              ),
            ],
          );
        },
      );

      group(
        'SortBy',
        () {
          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoading, ProductsPageLoaded] '
            'when ProductsFilterByEvent.sortBy return products',
            setUp: () {
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenAnswer(
                (_) async => [product],
              );
            },
            build: () => ProductsPageBloc(getProducts: getProducts),
            act: (bloc) => bloc.add(
              ProductsFilterByEvent(
                sortBy: SortBy.text(),
              ),
            ),
            expect: () => <ProductsPageState>[
              const ProductsPageLoading(),
              ProductsPageLoaded(
                products: [product],
              ),
            ],
          );

          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoading, ProductsPageLoaded] '
            'when ProductsFilterByEvent.filterBy return products',
            setUp: () {
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenAnswer(
                (_) async => [product],
              );
            },
            build: () => ProductsPageBloc(getProducts: getProducts),
            act: (bloc) => bloc.add(
              const ProductsFilterByEvent(
                filterBy: FilterBy(
                  minPrice: 1,
                  maxPrice: 2,
                ),
              ),
            ),
            expect: () => <ProductsPageState>[
              const ProductsPageLoading(),
              ProductsPageLoaded(
                products: [product],
              ),
            ],
          );

          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoading, ProductsPageLoaded] '
            'when ProductsFilterByEvent throws',
            setUp: () {
              exception = Exception();
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenThrow(exception!);
            },
            build: () => ProductsPageBloc(
              getProducts: getProducts,
            ),
            act: (bloc) => bloc.add(
              ProductsFilterByEvent(
                sortBy: SortBy.text(),
              ),
            ),
            expect: () => <ProductsPageState>[
              const ProductsPageLoading(),
              ProductsPageLoaded(
                products: const [],
                error: exception,
              ),
            ],
          );
        },
      );

      group(
        'Fetch',
        () {
          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoaded] '
            'when ProductsMoreEvent emitted',
            setUp: () {
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  page: any(named: 'page'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenAnswer(
                (_) async => [product],
              );
            },
            build: () => ProductsPageBloc(getProducts: getProducts),
            act: (bloc) => bloc.add(
              const ProductsMoreEvent(),
            ),
            expect: () => <ProductsPageState>[
              ProductsPageLoaded(
                products: [product],
              ),
            ],
          );

          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoaded(isLoadingMore: true), ProductsPageLoaded] '
            'when ProductsMoreEvent emitted',
            setUp: () {
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  page: any(named: 'page'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenAnswer(
                (_) async => [product],
              );
            },
            build: () => ProductsPageBloc(getProducts: getProducts)
              ..products = [product],
            act: (bloc) => bloc.add(
              const ProductsMoreEvent(),
            ),
            expect: () => <ProductsPageState>[
              ProductsPageLoaded(
                products: [product],
                isLoadingMore: true,
              ),
              ProductsPageLoaded(
                products: List.generate(
                  2,
                  (index) => product,
                ),
              ),
            ],
          );

          blocTest<ProductsPageBloc, ProductsPageState>(
            'emits [ProductsPageLoaded] '
            'when ProductsFilterByEvent throws',
            setUp: () {
              exception = Exception();
              when(
                () => getProducts.call(
                  query: any(named: 'query'),
                  perPage: any(named: 'perPage'),
                  sortBy: any(named: 'sortBy'),
                  filterBy: any(named: 'filterBy'),
                ),
              ).thenThrow(exception!);
            },
            build: () => ProductsPageBloc(
              getProducts: getProducts,
            ),
            act: (bloc) => bloc.add(
              const ProductsMoreEvent(),
            ),
            expect: () => <ProductsPageState>[
              ProductsPageLoaded(
                products: const [],
                error: exception,
              ),
            ],
          );
        },
      );
    },
  );
}
