import 'package:beercules/common/theme.dart';
import 'package:beercules/firebase_options.dart';
import 'package:beercules/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(await buildApp());
}

Future<Widget> buildApp() async => EasyLocalization(
      supportedLocales: const <Locale>[Locale('en'), Locale('de')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: Builder(
        builder: (final BuildContext context) => MaterialApp.router(
          builder: (final _, final Widget? child) =>
              ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: <Breakpoint>[
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(
                start: 1921,
                end: double.infinity,
                name: '4K',
              ),
            ],
          ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: BeerculesColors.primary,
              secondary: BeerculesColors.accent,
              background: BeerculesColors.backgroundColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
