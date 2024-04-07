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
