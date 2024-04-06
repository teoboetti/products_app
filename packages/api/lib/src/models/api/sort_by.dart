import 'package:api/src/models/api/sort_direction.dart';
import 'package:api/src/models/api/sort_type.dart';
import 'package:flutter/foundation.dart';

/// Helper class for sortby query
class SortBy {
  const SortBy._({
    required this.queryParams,
  });

  /// Factory method to sort by text
  factory SortBy.text({SortDirection? direction}) {
    return SortBy._(
      queryParams: [
        _buildSorting(
          SortType.textMatch,
          direction,
        ),
      ],
    );
  }

  /// Factory method to sort by selling price
  factory SortBy.sellingPrice({SortDirection? direction}) {
    return SortBy._(
      queryParams: [
        _buildSorting(
          SortType.sellingPrice,
          direction,
        ),
      ],
    );
  }

  /// Factory method to sort by selling price within a range
  factory SortBy.sellingPriceMinMax({
    required double minPrice,
    required double maxPrice,
    SortDirection? direction,
  }) {
    return SortBy._(
      queryParams: [
        _buildSorting(
          SortType.sellingPrice,
          direction,
        ),
        'minPrice=$minPrice',
        'maxPrice=$maxPrice',
      ],
    );
  }

  /// List of query params
  @visibleForTesting
  final List<String> queryParams;

  /// Method to convert parameters to a query string
  String toQueryParameter() {
    return queryParams.join('&');
  }

  static String _buildSorting(SortType type, SortDirection? direction) {
    var sorting = type.value;
    if (direction != null) {
      sorting += ':${direction.name}';
    }
    return sorting;
  }
}
