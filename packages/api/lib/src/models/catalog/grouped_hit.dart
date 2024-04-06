import 'package:api/src/models/catalog/hit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grouped_hit.g.dart';

/// {@template grouped_hit}
/// Represents grouped hits in the search results.
/// {@endtemplate}
@JsonSerializable()
class GroupedHit {
  /// {@macro grouped_hit}
  const GroupedHit({
    required this.hits,
  });

  /// {@macro grouped_hit}
  factory GroupedHit.fromJson(Map<String, dynamic> json) =>
      _$GroupedHitFromJson(json);

  /// hist
  final List<Hit> hits;

  /// {@macro grouped_hit} to json
  Map<String, dynamic> toJson() => _$GroupedHitToJson(this);
}
