part of 'products_page_bloc.dart';

sealed class ProductsPageEvent extends Equatable {
  const ProductsPageEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsFetchEvent extends ProductsPageEvent {
  const ProductsFetchEvent({
    this.query,
  });

  final String? query;

  @override
  List<Object?> get props => [
        query,
      ];
}

final class ProductsSortByEvent extends ProductsPageEvent {
  const ProductsSortByEvent({
    this.query,
    this.sortBy,
    this.filterBy,
  });

  final String? query;

  final SortBy? sortBy;

  final FilterBy? filterBy;

  @override
  List<Object?> get props => [
        query,
        sortBy,
        filterBy,
      ];
}

final class ProductSearchEvent extends ProductsPageEvent {
  const ProductSearchEvent({
    required this.query,
  });

  final String query;

  @override
  List<Object?> get props => [
        query,
      ];
}
