import 'package:beercules/services/navigation_service/navigation_service_aggregator.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/ui/screens/customize/customize_controller.dart';
import 'package:beercules/ui/screens/customize/customize_view.dart';
import 'package:beercules/ui/screens/game/game_controller.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:beercules/ui/screens/home/home_controller.dart';
import 'package:beercules/ui/screens/home/home_view.dart';
import 'package:beercules/ui/screens/landing/landing_view.dart';
import 'package:beercules/ui/screens/rules/rules_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: NavigationServiceRoutes.homeRouteUri,
  navigatorKey: rootNavigatorKey,
  redirect: (final BuildContext context, final GoRouterState state) {
    if (kIsWeb) {
      return NavigationServiceRoutes.landingRouteUri;
    }
    if (!kIsWeb && state.path == NavigationServiceRoutes.landingRouteUri) {
      return NavigationServiceRoutes.homeRouteUri;
    }
    return null;
  },
  onException: (
    final BuildContext context,
    final GoRouterState state,
    final GoRouter router,
  ) {
    debugPrint('GoRouter exception: ${state.error}');
  },
  routes: <RouteBase>[
    GoRoute(
      path: NavigationServiceRoutes.homeRouteUri,
      builder: (final _, final __) => BlocProvider<HomeController>(
        create: (final BuildContext context) => HomeControllerImplementation(
          navigationService: context.read<NavigationServiceAggregator>(),
        ),
        child: const HomeView(),
      ),
    ),
    GoRoute(
      path: NavigationServiceRoutes.gameRouteUri,
      builder: (final _, final __) => BlocProvider<GameController>(
        create: (final BuildContext context) => GameControllerImplementation(
          navigationService: context.read<NavigationServiceAggregator>(),
          persistenceService: context.read<PersistenceServiceAggregator>(),
        ),
        child: const GameView(),
      ),
    ),
    GoRoute(
      path: NavigationServiceRoutes.rulesRouteUri,
      builder: (final _, final __) => const RulesView(),
    ),
    GoRoute(
      path: NavigationServiceRoutes.customizeRouteUri,
      builder: (final _, final __) => BlocProvider<CustomizeController>(
        create: (final BuildContext context) =>
            CustomizeControllerImplementation(
          navigationService: context.read<NavigationServiceAggregator>(),
          persistenceService: context.read<PersistenceServiceAggregator>(),
        ),
        child: const CustomizeView(),
      ),
    ),
    GoRoute(
      path: NavigationServiceRoutes.landingRouteUri,
      builder: (final _, final __) => const LandingView(),
    ),
  ],
);
