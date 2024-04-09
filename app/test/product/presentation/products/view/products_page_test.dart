import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';
import 'package:products_app/product/presentation/products/bloc/products_page_bloc.dart';
import 'package:products_app/product/presentation/products/components/empty_search.dart';
import 'package:products_app/product/presentation/products/components/filter_bottomsheet.dart';
import 'package:products_app/product/presentation/products/components/filter_icon_button.dart';
import 'package:products_app/product/presentation/products/components/loading.dart';
import 'package:products_app/product/presentation/products/components/order_bottomsheet.dart';
import 'package:products_app/product/presentation/products/components/start_search.dart';
import 'package:products_app/product/presentation/products/products.dart';

import '../../../../helpers/helpers.dart';

class MockGetProducts extends Mock implements GetProducts {}

class MockProductsPageBloc
    extends MockBloc<ProductsPageEvent, ProductsPageState>
    implements ProductsPageBloc {}

void main() {
  late MockProductsPageBloc bloc;

  setUpAll(
    () {
      bloc = MockProductsPageBloc();
    },
  );

  group(
    'ProductsPage:',
    () {
      testWidgets(
        'should render StartSearch on ProductsPageInitial',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(StartSearch), findsOneWidget);
        },
      );

      testWidgets(
        'should render Loading on ProductsPageLoading',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            const ProductsPageLoading(),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(StartSearch), findsNothing);
          expect(find.byType(Loading), findsOneWidget);
        },
      );

      testWidgets(
        'should render EmptySearch on ProductsPageEmptySearch',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            const ProductsPageEmptySearch(),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(StartSearch), findsNothing);
          expect(find.byType(Loading), findsNothing);
          expect(find.byType(EmptySearch), findsOneWidget);
        },
      );

      testWidgets(
        'should render ProductsContent on ProductsPageLoaded',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            const ProductsPageLoaded(
              products: [
                Product(
                  id: 'id',
                  image: 'image',
                  title: 'title',
                  description: 'description',
                  url: 'url',
                  listPrice: 1,
                  sellingPrice: 1,
                  merchant: 'merchant',
                ),
              ],
            ),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(StartSearch), findsNothing);
          expect(find.byType(Loading), findsNothing);
          expect(find.byType(EmptySearch), findsNothing);
          expect(find.byType(ProductsContent), findsOneWidget);
        },
      );

      testWidgets(
        'should render ErrorSnackbar on ProductsPageLoaded.error',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              ProductsPageLoaded(
                products: const [
                  Product(
                    id: 'id',
                    image: 'image',
                    title: 'title',
                    description: 'description',
                    url: 'url',
                    listPrice: 1,
                    sellingPrice: 1,
                    merchant: 'merchant',
                  ),
                ],
                error: Exception(),
              ),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            ProductsPageLoaded(
              products: const [
                Product(
                  id: 'id',
                  image: 'image',
                  title: 'title',
                  description: 'description',
                  url: 'url',
                  listPrice: 1,
                  sellingPrice: 1,
                  merchant: 'merchant',
                ),
              ],
              error: Exception(),
            ),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(StartSearch), findsNothing);
          expect(find.byType(Loading), findsNothing);
          expect(find.byType(EmptySearch), findsNothing);
          expect(find.byType(ProductsContent), findsOneWidget);

          await tester.pump();

          expect(find.byType(SnackBar), findsOneWidget);
        },
      );

      testWidgets(
        'should render FilterBottomsheet on filter tap',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            const ProductsPageLoaded(
              products: [
                Product(
                  id: 'id',
                  image: 'image',
                  title: 'title',
                  description: 'description',
                  url: 'url',
                  listPrice: 1,
                  sellingPrice: 1,
                  merchant: 'merchant',
                ),
              ],
            ),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(FilterIconButton), findsNWidgets(2));

          await tester.tap(find.byType(FilterIconButton).first);
          await tester.pumpAndSettle();

          expect(find.byType(FilterBottomsheet), findsOneWidget);
        },
      );

      testWidgets(
        'should render FilterBottomsheet on filter tap',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            const ProductsPageLoaded(
              products: [
                Product(
                  id: 'id',
                  image: 'image',
                  title: 'title',
                  description: 'description',
                  url: 'url',
                  listPrice: 1,
                  sellingPrice: 1,
                  merchant: 'merchant',
                ),
              ],
            ),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(FilterIconButton), findsNWidgets(2));

          await tester.tap(find.byType(FilterIconButton).last);
          await tester.pumpAndSettle();

          expect(find.byType(OrderBottomsheet), findsOneWidget);
        },
      );
    },
  );

  group(
    'ProductsContent: ',
    () {
      testWidgets(
        'should render Loading on ProductsPageLoaded.isLoadingMore',
        (tester) async {
          tester.view.physicalSize = const Size(400, 800);
          tester.view.devicePixelRatio = 1;

          whenListen(
            bloc,
            Stream.fromIterable([
              const ProductsPageInitial(),
            ]),
            initialState: const ProductsPageInitial(),
          );

          when(() => bloc.state).thenReturn(
            const ProductsPageLoaded(
              products: [
                Product(
                  id: 'id',
                  image: 'image',
                  title: 'title',
                  description: 'description',
                  url: 'url',
                  listPrice: 1,
                  sellingPrice: 1,
                  merchant: 'merchant',
                ),
              ],
              isLoadingMore: true,
            ),
          );

          await tester.pumpApp(
            BlocProvider<ProductsPageBloc>.value(
              value: bloc,
              child: const ProductsView(),
            ),
          );

          expect(find.byType(ProductsContent), findsOneWidget);
          expect(find.byType(Loading), findsOneWidget);
        },
      );
    },
  );
}
