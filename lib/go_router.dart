import 'package:beercules/services/navigation_service/navigation_service_aggregator.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:beercules/services/persistence/persistence_service_aggregator.dart';
import 'package:beercules/ui/screens/customize/customize_page.dart';
import 'package:beercules/ui/screens/game/game_cubit.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:beercules/ui/screens/home/home_controller.dart';
import 'package:beercules/ui/screens/home/home_view.dart';
import 'package:beercules/ui/screens/landing/landing_view.dart';
import 'package:beercules/ui/screens/rules/rules_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

GoRouter goRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: NavigationServiceRoutes.homeRouteUri,
  navigatorKey: rootNavigatorKey,
  redirect: (BuildContext context, GoRouterState state) {
    if (kIsWeb) {
      return NavigationServiceRoutes.landingRouteUri;
    }
    if (!kIsWeb && state.path == NavigationServiceRoutes.landingRouteUri) {
      return NavigationServiceRoutes.homeRouteUri;
    }
    return null;
  },
  onException: (
    BuildContext context,
    GoRouterState state,
    GoRouter router,
  ) {
    debugPrint('GoRouter exception: ${state.error}');
  },
  routes: <RouteBase>[
    GoRoute(
      path: NavigationServiceRoutes.homeRouteUri,
      builder: (_, __) => BlocProvider<HomeController>(
        create: (BuildContext context) => HomeControllerImplementation(
          navigationService: context.read<NavigationServiceAggregator>(),
        ),
        child: const HomeView(),
      ),
    ),
    GoRoute(
      path: NavigationServiceRoutes.gameRouteUri,
      builder: (_, __) => BlocProvider<GameCubit>(
        create: (BuildContext context) => GameCubitImplementation(
          navigationService: context.read<NavigationServiceAggregator>(),
          persistenceService: context.read<PersistenceServiceAggregator>(),
        ),
        child: const GameView(),
      ),
    ),
    GoRoute(
      path: NavigationServiceRoutes.rulesRouteUri,
      builder: (_, __) => const RulesView(),
    ),
    GoRoute(
      path: NavigationServiceRoutes.customizeRouteUri,
      builder: (_, __) => const CardDetailsPage(),
    ),
    GoRoute(
      path: NavigationServiceRoutes.landingRouteUri,
      builder: (_, __) => const LandingView(),
    ),
  ],
);
