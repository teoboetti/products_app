import 'package:equatable/equatable.dart';

/// {@template filterby}
/// Helper class for min max query parameter
/// {@endtemplate}
class FilterBy extends Equatable {
  /// {@macro filterby}
  const FilterBy({
    required this.minPrice,
    required this.maxPrice,
  });

  /// minPrice
  final double minPrice;

  /// maxPrice
  final double maxPrice;

  @override
  List<Object?> get props => [
        minPrice,
        maxPrice,
      ];
}
