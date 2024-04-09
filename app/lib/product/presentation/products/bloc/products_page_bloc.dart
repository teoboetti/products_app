import 'package:api/api.dart';
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
    on<ProductsSortByEvent>(_sortBy);
    on<ProductSearchEvent>(_search);
  }

  final GetProducts _getProducts;

  int page = 1;
  int perPage = 8;
  List<Product> products = [];
  bool hasReachedMax = false;

  String? query;
  SortBy? sortBy;
  FilterBy? filterBy;

  Future<void> _fetchProducts(
    ProductsFetchEvent event,
    Emitter<ProductsPageState> emit,
  ) async {
    try {
      final isInitial = products.isEmpty;

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
        sortBy: sortBy,
        filterBy: filterBy,
      );

      if (isInitial) {
        products = response;
      } else {
        products = products + response;
      }

      query = event.query;
      page = page + 1;
      hasReachedMax = response.length < perPage;

      emit(
        ProductsPageLoaded(
          products: products,
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

  Future<void> _sortBy(
    ProductsSortByEvent event,
    Emitter<ProductsPageState> emit,
  ) async {
    try {
      emit(const ProductsPageLoading());

      page = 1;
      query = event.query;
      sortBy = event.sortBy ?? sortBy;
      filterBy = event.filterBy ?? filterBy;

      final response = await _getProducts.call(
        query: query,
        perPage: perPage,
        sortBy: sortBy,
        filterBy: filterBy,
      );

      products = response;
      hasReachedMax = response.length < perPage;

      emit(
        ProductsPageLoaded(
          products: products,
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

  Future<void> _search(
    ProductSearchEvent event,
    Emitter<ProductsPageState> emit,
  ) async {
    try {
      emit(const ProductsPageLoading());

      page = 1;
      query = event.query;
      sortBy = null;
      filterBy = null;

      final response = await _getProducts.call(
        query: query,
      );

      products = response;
      hasReachedMax = response.length < perPage;

      if (products.isNotEmpty) {
        emit(
          ProductsPageLoaded(
            products: products,
          ),
        );
      } else {
        emit(
          const ProductsPageEmptySearch(),
        );
      }
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
