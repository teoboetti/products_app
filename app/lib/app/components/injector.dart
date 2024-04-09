import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/core/di/injector.dart';
import 'package:products_app/product/data/product_repository.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';

class Injector extends StatelessWidget {
  const Injector({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CatalogApi>(
          create: (context) => CatalogApi(
            client: getIt<Dio>(),
          ),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepository(
            api: context.read<CatalogApi>(),
          ),
        ),
        RepositoryProvider<GetProducts>(
          create: (context) => GetProducts(
            repository: context.read<ProductRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
