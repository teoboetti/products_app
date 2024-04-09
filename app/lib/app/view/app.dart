import 'package:flutter/material.dart';
import 'package:products_app/app/components/injector.dart';
import 'package:products_app/app_theme.dart';
import 'package:products_app/core/di/injector.dart';
import 'package:products_app/core/router/router.dart';
import 'package:products_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Injector(
      child: MaterialApp.router(
        routerConfig: getIt<AppRouter>().routerConfig,
        theme: AppTheme.baseTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
