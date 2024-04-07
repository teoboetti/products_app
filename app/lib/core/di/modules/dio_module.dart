import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://catalog-api.dev-cat.scalapay.com',
        ),
      );
}
