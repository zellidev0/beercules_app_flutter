import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/landing/landing_view.dart';
import 'package:beercules/rules/rules_view.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter goRouter(final GoRouterRef ref) => GoRouter(
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
          builder: (final BuildContext context, final __) => const HomeView(),
        ),
        GoRoute(
          path: NavigationServiceRoutes.gameRouteUri,
          builder: (final BuildContext context, final __) => const GameView(),
        ),
        GoRoute(
          path: NavigationServiceRoutes.rulesRouteUri,
          builder: (final BuildContext context, final __) => const RulesView(),
        ),
        GoRoute(
          path: NavigationServiceRoutes.customizeRouteUri,
          builder: (final BuildContext context, final __) =>
              const CustomizeView(),
        ),
        GoRoute(
          path: NavigationServiceRoutes.landingRouteUri,
          builder: (final BuildContext context, final __) =>
              const LandingView(),
        ),
      ],
    );
