import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/counter/counter.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterPage();
  }
}
