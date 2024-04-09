import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products_app/app/components/injector.dart';
import 'package:products_app/colors.dart';
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
          bottomSheetTheme: BottomSheetThemeData(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
            ),
            backgroundColor: AppColors.lightBackground,
          ),
          cardTheme: const CardTheme(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
          ),
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.brand;
                }

                return AppColors.lightWeightBrand;
              },
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              textStyle: MaterialStatePropertyAll(
                GoogleFonts.poppinsTextTheme().labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.lightWeightBrand;
                  }

                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.brand.withOpacity(0.7);
                  }

                  return AppColors.brand;
                },
              ),
              foregroundColor: const MaterialStatePropertyAll(
                Colors.white,
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                GoogleFonts.poppinsTextTheme().labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              foregroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.lightWeightBrand;
                  }

                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.brand.withOpacity(0.7);
                  }

                  return AppColors.brand;
                },
              ),
            ),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
