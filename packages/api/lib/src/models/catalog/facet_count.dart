import 'package:api/src/models/catalog/count.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facet_count.g.dart';

/// {@template facet_count}
/// Represents facet counts in the search results.
/// {@endtemplate}
@JsonSerializable()
class FacetCount {
  /// {@macro facet_count}
  const FacetCount({
    required this.fieldName,
    required this.counts,
    required this.stats,
  });

  /// {@macro facet_count}
  factory FacetCount.fromJson(Map<String, dynamic> json) =>
      _$FacetCountFromJson(json);

  /// field_name
  @JsonKey(name: 'field_name')
  final String fieldName;

  /// counts
  final List<Count> counts;

  /// stats
  final Map<String, dynamic> stats;

  /// {@macro facet_count} to json
  Map<String, dynamic> toJson() => _$FacetCountToJson(this);
}
