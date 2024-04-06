import 'package:api/src/models/api/sort_by.dart';
import 'package:api/src/models/catalog/catalog_response.dart';
import 'package:dio/dio.dart';

/// Abstract class for [CatalogApi]
abstract class ICatalogApi {
  /// get catalog call
  /// [query] string query
  /// [page] page number
  /// [perPage] batch
  /// [sortBy] sorting
  Future<CatalogResponse> getCatalog({
    String? query,
    int? page = 1,
    int? perPage = 30,
    SortBy? sortBy,
  });
}

/// {@template api}
/// Catalog API
/// {@endtemplate}
class CatalogApi implements ICatalogApi {
  /// {@macro api}
  const CatalogApi({
    required Dio client,
  }) : _client = client;

  final Dio _client;

  @override
  Future<CatalogResponse> getCatalog({
    String? query,
    int? page = 1,
    int? perPage = 30,
    SortBy? sortBy,
  }) async {
    try {
      final uri = Uri(
        path: '/v1/products/search',
        queryParameters: {
          if (query != null) 'q': query,
          if (page != null) 'page': '$page',
          if (perPage != null) 'per_page': '$perPage',
          if (sortBy != null) 'sort_by': sortBy.toQueryParameter(),
          'partnerId': 'scalapayappit',
          'source': 'trovaprezzi',
          'language': 'it',
          'country': 'IT',
        },
      );

      final response = await _client.getUri<Map<String, dynamic>>(
        uri,
      );
      final data = response.data;

      if (data == null) {
        throw ArgumentError.notNull('response.data');
      }

      return CatalogResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
