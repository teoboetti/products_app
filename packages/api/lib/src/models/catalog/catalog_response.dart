import 'package:api/src/models/catalog/facet_count.dart';
import 'package:api/src/models/catalog/grouped_hit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_response.g.dart';

/// {@template catalog_response}
/// Catalog Response
/// {@endtemplate}
@JsonSerializable()
class CatalogResponse {
  /// {@macro catalog_response}
  const CatalogResponse({
    required this.page,
    required this.found,
    required this.source,
    required this.facetCounts,
    required this.groupedHits,
  });

  /// {@macro catalog_response}
  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseFromJson(json);

  /// page
  final int page;

  /// found
  final int found;

  /// source
  final String source;

  /// facet_counts
  @JsonKey(name: 'facet_counts')
  final List<FacetCount> facetCounts;

  /// grouped_hits
  @JsonKey(name: 'grouped_hits')
  final List<GroupedHit> groupedHits;

  /// {@macro catalog_response} to json
  Map<String, dynamic> toJson() => _$CatalogResponseToJson(this);
}
