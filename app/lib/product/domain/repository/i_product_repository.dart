import 'package:api/api.dart';
import 'package:products_app/product/domain/entity/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts({
    String? query,
    int? page = 1,
    int? perPage = 30,
    SortBy? sortBy,
    FilterBy? filterBy,
  });
}
