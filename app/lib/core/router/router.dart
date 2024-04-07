import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/core/router/routes.dart';

class AppRouter {
  final GoRouter routerConfig = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: const HomeRoute().location,
    routes: $appRoutes,
  );
}
