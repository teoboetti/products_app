/// Sorting Type enum
enum SortType {
  /// text match
  textMatch('_text_match'),

  /// selling price
  sellingPrice('selling_price');

  const SortType(this.value);

  /// string value
  final String value;
}
