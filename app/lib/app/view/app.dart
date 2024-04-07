import 'package:flutter/material.dart';
import 'package:products_app/app/components/injector.dart';
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
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            constraints: BoxConstraints(
              minWidth: double.infinity,
            ),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
