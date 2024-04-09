part of 'products_page_bloc.dart';

sealed class ProductsPageState extends Equatable {
  const ProductsPageState();

  @override
  List<Object?> get props => [];
}

final class ProductsPageInitial extends ProductsPageState {
  const ProductsPageInitial();
}

final class ProductsPageLoading extends ProductsPageState {
  const ProductsPageLoading();
}

final class ProductsPageEmptySearch extends ProductsPageState {
  const ProductsPageEmptySearch();
}

final class ProductsPageLoaded extends ProductsPageState {
  const ProductsPageLoaded({
    required this.products,
    this.isLoadingMore = false,
    this.error,
  });

  final List<Product> products;

  final bool isLoadingMore;

  final Object? error;

  @override
  List<Object?> get props => [
        products,
        isLoadingMore,
        error,
      ];
}
