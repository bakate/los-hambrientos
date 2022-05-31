import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:los_hambrientos/src/l10n/loc.dart';
import 'package:los_hambrientos/src/routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: GoogleFonts.sourceSansProTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black26,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            /*  primary: const Color(0xFF22A45D), // background (button) color
            onPrimary: Colors.white, */ //   onPrimary: Colors.white,
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.8),
            // ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFEF9920),
          onSecondary: Colors.white,
          primary: const Color(0xFF22A45D),
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
