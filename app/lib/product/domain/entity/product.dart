import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.url,
    required this.listPrice,
    required this.sellingPrice,
  });

  final String id;

  final String image;

  final String title;

  final String description;

  final String url;

  final double listPrice;

  final double sellingPrice;

  @override
  List<Object?> get props => [
        id,
        image,
        title,
        description,
        url,
        listPrice,
        sellingPrice,
      ];
}
