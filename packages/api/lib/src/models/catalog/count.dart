import 'package:json_annotation/json_annotation.dart';

part 'count.g.dart';

/// {@template count}
/// Represents a count for a specific value under a field in facet counts.
/// {@endtemplate}
@JsonSerializable()
class Count {
  /// {@macro count}
  const Count({
    required this.count,
    required this.highlighted,
    required this.value,
  });

  /// {@macro count}
  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);

  /// count
  final int count;

  /// highlighted
  final String highlighted;

  /// value
  final String value;

  /// {@macro count} to json
  Map<String, dynamic> toJson() => _$CountToJson(this);
}
