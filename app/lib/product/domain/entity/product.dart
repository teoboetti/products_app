import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.url,
    required this.listPrice,
    required this.sellingPrice,
    required this.merchant,
  });

  final String id;

  final String image;

  final String title;

  final String description;

  final String url;

  final double listPrice;

  final double sellingPrice;

  final String merchant;

  String get fomattedSellingPrice {
    return NumberFormat.currency(symbol: '€', locale: 'it')
        .format(sellingPrice);
  }

  String get singleInstallment {
    final installment = sellingPrice / 3;

    return NumberFormat.currency(
      symbol: '€',
      locale: 'it',
    ).format(installment);
  }

  @override
  List<Object?> get props => [
        id,
        image,
        title,
        description,
        url,
        listPrice,
        sellingPrice,
        merchant,
      ];
}
