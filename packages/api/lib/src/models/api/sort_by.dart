import 'package:api/src/models/api/sort_direction.dart';
import 'package:api/src/models/api/sort_type.dart';
import 'package:equatable/equatable.dart';

/// Helper class for sortby query
class SortBy extends Equatable {
  const SortBy._({
    required this.type,
    this.direction,
  });

  /// Factory method to sort by text
  factory SortBy.text({SortDirection? direction}) {
    return SortBy._(
      type: SortType.textMatch,
      direction: direction,
    );
  }

  /// Factory method to sort by selling price
  factory SortBy.sellingPrice({SortDirection? direction}) {
    return SortBy._(
      type: SortType.sellingPrice,
      direction: direction,
    );
  }

  /// type
  final SortType type;

  /// direction
  final SortDirection? direction;

  /// Method to convert parameters to a query string
  String toQueryParameter() {
    if (direction != null) {
      return '${type.value}:${direction!.name}';
    } else {
      return type.value;
    }
  }

  @override
  List<Object?> get props => [
        type,
        direction,
      ];
}
