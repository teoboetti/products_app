part of 'products_page_bloc.dart';

sealed class ProductsPageEvent extends Equatable {
  const ProductsPageEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsMoreEvent extends ProductsPageEvent {
  const ProductsMoreEvent();
}

final class ProductsFilterByEvent extends ProductsPageEvent {
  const ProductsFilterByEvent({
    this.sortBy,
    this.filterBy,
  });

  final SortBy? sortBy;

  final FilterBy? filterBy;

  @override
  List<Object?> get props => [
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
