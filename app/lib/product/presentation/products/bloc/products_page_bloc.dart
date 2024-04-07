import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';

part 'products_page_event.dart';
part 'products_page_state.dart';

class ProductsPageBloc extends Bloc<ProductsPageEvent, ProductsPageState> {
  ProductsPageBloc({required GetProducts getProducts})
      : _getProducts = getProducts,
        super(
          const ProductsPageInitial(),
        ) {
    on<ProductsFetchEvent>(_fetchProducts);
  }

  final GetProducts _getProducts;

  int page = 1;
  int perPage = 8;
  List<Product> products = [];

  String? query;

  Future<void> _fetchProducts(
    ProductsFetchEvent event,
    Emitter<ProductsPageState> emit,
  ) async {
    try {
      final isInitial = page == 1;

      if (!isInitial) {
        emit(
          ProductsPageLoaded(
            products: products,
            isLoadingMore: true,
          ),
        );
      }

      final response = await _getProducts.call(
        query: event.query,
        page: page,
        perPage: perPage,
      );

      if (isInitial) {
        products = response;
      } else {
        products = products + response;
      }

      query = event.query;
      page = page + 1;

      emit(
        ProductsPageLoaded(
          products: products,
          reachedMax: response.length < perPage,
        ),
      );
    } catch (e, stackTrace) {
      emit(
        ProductsPageLoaded(
          products: products,
          error: e,
        ),
      );
      addError(e, stackTrace);
    }
  }
}
