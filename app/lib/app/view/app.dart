import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          textTheme: GoogleFonts.poppinsTextTheme(),
          bottomSheetTheme: const BottomSheetThemeData(
            constraints: BoxConstraints(
              minWidth: double.infinity,
            ),
          ),
          cardTheme: const CardTheme(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
