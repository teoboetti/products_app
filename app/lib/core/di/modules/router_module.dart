import 'package:injectable/injectable.dart';
import 'package:products_app/core/router/router.dart';

@module
abstract class RouterModule {
  @singleton
  AppRouter get router => AppRouter();
}
