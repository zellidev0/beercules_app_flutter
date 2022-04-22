import 'package:beamer/beamer.dart';
import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/rules/rules_view.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late BeamerDelegate globalBeamerDelegate;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(await buildApp());
}

Future<Widget> buildApp() async {
  ProviderContainer providerContainer = ProviderContainer();
  globalBeamerDelegate = createBeamerDelegate(read: providerContainer.read);
  return UncontrolledProviderScope(
    container: providerContainer,
    child: MyApp(
      beamerDelegate: globalBeamerDelegate,
      beamerParser: BeamerParser(),
    ),
  );
}

BeamerDelegate createBeamerDelegate({required Reader read}) => BeamerDelegate(
      initialPath: NavigationService.homeRouteUri,
      locationBuilder: RoutesLocationBuilder(
        routes: {
          NavigationService.homeRouteUri: (_, __, ___) => const BeamPage(
                key: ValueKey<String>(NavigationService.homeRouteUri),
                title: 'Home',
                child: HomeView(),
              ),
          NavigationService.gameRouteUri: (_, __, ___) => const BeamPage(
                key: ValueKey<String>(NavigationService.gameRouteUri),
                title: 'Game',
                child: GameView(),
              ),
          NavigationService.rulesRouteUri: (_, __, ___) => const BeamPage(
                key: ValueKey<String>(NavigationService.rulesRouteUri),
                title: 'Rules',
                child: RulesView(),
              ),
          NavigationService.customizeRouteUri: (_, __, ___) => const BeamPage(
                key: ValueKey<String>(NavigationService.customizeRouteUri),
                title: 'Customize',
                child: CustomizeView(),
              ),
        },
      ),
    );

class MyApp extends StatelessWidget {
  final BeamerDelegate _beamerDelegate;
  final BeamerParser _beamerParser;

  const MyApp({
    Key? key,
    required BeamerDelegate beamerDelegate,
    required BeamerParser beamerParser,
  })  : _beamerDelegate = beamerDelegate,
        _beamerParser = beamerParser,
        super(key: key);

  @override
  Widget build(BuildContext context) => EasyLocalization(
        supportedLocales: const <Locale>[Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        path: 'assets/translations',
        useOnlyLangCode: true,
        child: BeamerProvider(
          routerDelegate: _beamerDelegate,
          child: Builder(
            builder: (BuildContext context) => MaterialApp.router(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: BeerculesColors.primary,
                  secondary: BeerculesColors.accent,
                  background: BeerculesColors.primary.withAlpha(150),
                ),
              ),
              routeInformationParser: _beamerParser,
              routerDelegate: _beamerDelegate,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
            ),
          ),
        ),
      );
}
