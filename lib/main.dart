import 'package:beamer/beamer.dart';
import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/landing/landing_view.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/rules/rules_view.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'firebase_options.dart';

late BeamerDelegate globalBeamerDelegate;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialPath: NavigationService.landingRouteUri,
      guards: [
        BeamGuard(
          pathPatterns: [],
          // perform the check on all patterns that **don't** have a match in pathPatterns
          guardNonMatching: true,
          // return false to redirect
          check: (context, location) => !kIsWeb,
          // where to redirect on a false check
          beamToNamed: (origin, target) => NavigationService.landingRouteUri,
        ),
        BeamGuard(
          pathPatterns: [NavigationService.baseUri],
          // perform the check on all patterns that **don't** have a match in pathPatterns
          guardNonMatching: false,
          // return false to redirect
          check: (context, location) => false,
          // where to redirect on a false check
          beamToNamed: (origin, target) => NavigationService.landingRouteUri,
        ),
      ],
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
          NavigationService.landingRouteUri: (_, __, ___) => const BeamPage(
                key: ValueKey<String>(NavigationService.landingRouteUri),
                title: 'Landing',
                child: LandingView(),
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
        path: 'assets/translations',
        useOnlyLangCode: true,
        child: BeamerProvider(
          routerDelegate: _beamerDelegate,
          child: Builder(
            builder: (BuildContext context) => MaterialApp.router(
              builder: (context, child) => ResponsiveWrapper.builder(
                child,
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(480, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(
                  color: BeerculesColors.backgroundColor,
                ),
              ),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: BeerculesColors.primary,
                  secondary: BeerculesColors.accent,
                  background: BeerculesColors.backgroundColor,
                ),
              ),
              debugShowCheckedModeBanner: false,
              backButtonDispatcher:
                  BeamerBackButtonDispatcher(delegate: globalBeamerDelegate),
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
