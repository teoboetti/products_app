import 'package:api/api.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/repository/i_product_repository.dart';

class GetProducts {
  const GetProducts({
    required IProductRepository repository,
  }) : _repository = repository;

  final IProductRepository _repository;

  Future<List<Product>> call({
    String? query,
    int? page = 1,
    int? perPage = 30,
    SortBy? sortBy,
    FilterBy? filterBy,
  }) async {
    return _repository.getProducts(
      query: query,
      page: page,
      perPage: perPage,
      sortBy: sortBy,
      filterBy: filterBy,
    );
  }
}
