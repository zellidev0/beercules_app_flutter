import 'package:beamer/beamer.dart';
import 'package:beercules_flutter/home/home_view.dart';
import 'package:beercules_flutter/navigation_service.dart';
import 'package:beercules_flutter/theme.dart';
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
      locationBuilder: RoutesLocationBuilder(
        routes: {
          NavigationService.homeRouteUri: (_, __, ___) => const BeamPage(
                key: ValueKey<String>(NavigationService.homeRouteUri),
                title: 'Home',
                child: HomeView(),
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
