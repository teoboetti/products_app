import 'package:api/src/models/catalog/document.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hit.g.dart';

/// {@template hit}
/// Represents an individual hit in the search results.
/// {@endtemplate}
@JsonSerializable()
class Hit {
  /// {@macro hit}
  const Hit({
    required this.document,
  });

  /// {@macro hit}
  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);

  /// document
  final Document document;

  /// {@macro hit} to json
  Map<String, dynamic> toJson() => _$HitToJson(this);
}
