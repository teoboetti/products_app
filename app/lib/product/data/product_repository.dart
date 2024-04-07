import 'package:api/api.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/repository/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  const ProductRepository({
    required CatalogApi api,
  }) : _api = api;

  final CatalogApi _api;

  @override
  Future<List<Product>> getProducts({
    String? query,
    int? page = 1,
    int? perPage = 30,
    SortBy? sortBy,
  }) async {
    final result = await _api.getCatalog(
      query: query,
      page: page,
      perPage: perPage,
      sortBy: sortBy,
    );

    if (result.found <= 0) {
      return [];
    }

    return result.groupedHits.fold<List<Product>>(
      [],
      (value, grouped) {
        for (final hit in grouped.hits) {
          final document = hit.document;

          value.add(
            Product(
              id: document.id,
              image: document.image,
              title: document.title,
              description: document.description,
              url: document.url,
              listPrice: document.listPrice,
              sellingPrice: document.sellingPrice,
            ),
          );
        }

        return value;
      },
    );
  }
}
