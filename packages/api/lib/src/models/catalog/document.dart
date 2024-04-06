import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

/// {@template document}
/// Represents the details of a document in the search results.
/// {@endtemplate}
@JsonSerializable()
class Document {
  /// {@macro document}
  const Document({
    required this.affiliateUrl,
    required this.brand,
    required this.category,
    required this.category1,
    required this.category2,
    required this.description,
    required this.discountPercentage,
    required this.hasImage,
    required this.id,
    required this.image,
    required this.imageMerchant,
    required this.listPrice,
    required this.merchant,
    required this.merchantID,
    required this.newOffer,
    required this.sellingPrice,
    required this.tags,
    required this.title,
    required this.url,
  });

  /// {@macro document}
  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  /// affiliate_url
  @JsonKey(name: 'affiliate_url')
  final String affiliateUrl;

  /// brand
  final String brand;

  /// category
  final String category;

  /// category_1
  @JsonKey(name: 'category_1')
  final String category1;

  /// category_2
  @JsonKey(name: 'category_2')
  final String category2;

  /// description
  final String description;

  /// discount_percentage
  @JsonKey(name: 'discount_percentage')
  final int discountPercentage;

  /// has_image
  @JsonKey(name: 'has_image')
  final int hasImage;

  /// id
  final String id;

  /// image
  final String image;

  /// image_merchant
  @JsonKey(name: 'image_merchant')
  final String imageMerchant;

  /// list_price
  @JsonKey(name: 'list_price')
  final double listPrice;

  /// merchant
  final String merchant;

  /// merchantId
  @JsonKey(name: 'merchantId')
  final String merchantID;

  /// new_offer
  @JsonKey(name: 'new_offer')
  final bool newOffer;

  /// selling_price
  @JsonKey(name: 'selling_price')
  final double sellingPrice;

  /// tags
  final List<String> tags;

  /// title
  final String title;

  /// url
  final String url;

  /// {@macro document} to json
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
