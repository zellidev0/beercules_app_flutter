import 'dart:async';

import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/landing/landing_view.dart';
import 'package:beercules/rules/rules_view.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_service.g.dart';

abstract interface class NavigationService {
  void closeDialog<T>({required final T? data});
  void goBack({final Uri? fallbackUri});
  void pop<T>({final T? data});
  void push(final String uri);
  void replaceWith(final Uri uri);
  void replaceWithNamed(final Uri uri);
  void showSnackBar(final String message);
  TaskEither<Object, Option<T>> showPopup<T>(final Widget popup);
  TaskEither<Object, Option<T>> showModal<T>(final Widget widget);
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter goRouter(final GoRouterRef ref) => GoRouter(
      debugLogDiagnostics: kDebugMode,
      initialLocation: NavigationServiceRoutes.homeRouteUri,
      navigatorKey: rootNavigatorKey,
      redirect: (final BuildContext context, final GoRouterState state) {
        if (!kIsWeb && state.path == NavigationServiceRoutes.landingRouteUri) {
          return NavigationServiceRoutes.landingRouteUri;
        }
        if (kIsWeb && state.path == NavigationServiceRoutes.landingRouteUri) {
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
          builder: (final BuildContext context, final __) => Consumer(
            builder: (final _, final WidgetRef ref, final __) =>
                const HomeView(),
          ),
        ),
        GoRoute(
          path: NavigationServiceRoutes.gameRouteUri,
          builder: (final BuildContext context, final __) => Consumer(
            builder: (final _, final WidgetRef ref, final __) =>
                const GameView(),
          ),
        ),
        GoRoute(
          path: NavigationServiceRoutes.rulesRouteUri,
          builder: (final BuildContext context, final __) => Consumer(
            builder: (final _, final WidgetRef ref, final __) =>
                const RulesView(),
          ),
        ),
        GoRoute(
          path: NavigationServiceRoutes.customizeRouteUri,
          builder: (final BuildContext context, final __) => Consumer(
            builder: (final _, final WidgetRef ref, final __) =>
                const CustomizeView(),
          ),
        ),
        GoRoute(
          path: NavigationServiceRoutes.landingRouteUri,
          builder: (final BuildContext context, final __) => Consumer(
            builder: (final _, final WidgetRef ref, final __) =>
                const LandingView(),
          ),
        ),
      ],
    );

@riverpod
NavigationService goRouterNavigationService(
  final GoRouterNavigationServiceRef ref,
) =>
    GoRouterNavigationService(goRouter: ref.watch(goRouterProvider));

class GoRouterNavigationService implements NavigationService {
  final GoRouter _goRouter;

  GoRouterNavigationService({
    required final GoRouter goRouter,
  }) : _goRouter = goRouter;

  @override
  void closeDialog<T>({required final T? data}) => _goRouter.pop(data);

  @override
  void goBack({final Uri? fallbackUri}) {
    if (_goRouter.canPop()) {
      _goRouter.pop();
    } else if (fallbackUri != null) {
      _goRouter.go(fallbackUri.toString());
    }
  }

  @override
  void pop<T>({final T? data}) => _goRouter.pop(data);

  @override
  void push(final String uri) => unawaited(_goRouter.push(uri));

  @override
  void replaceWith(final Uri uri) => unawaited(
        _goRouter.pushReplacement(uri.toString()),
      );

  @override
  void replaceWithNamed(final Uri uri) => unawaited(
        _goRouter.replace(uri.toString()),
      );

  @override
  TaskEither<Object, Option<T>> showPopup<T>(final Widget popup) =>
      optionOf(_goRouter.routerDelegate.navigatorKey.currentContext).fold(
        () => TaskEither<Object, Option<T>>(
          () async =>
              left('Error when searching for context - navigation service'),
        ),
        (final BuildContext context) => TaskEither<Object, Option<T>>.tryCatch(
          () async => optionOf(
            await showDialog<T>(
              context: context,
              builder: (final _) => popup,
            ),
          ),
          (final Object error, final _) => error,
        ),
      );

  @override
  void showSnackBar(final String message) =>
      optionOf(_goRouter.routerDelegate.navigatorKey.currentContext).fold(
        () {},
        (final BuildContext context) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        ),
      );

  @override
  TaskEither<Object, Option<T>> showModal<T>(final Widget widget) =>
      optionOf(_goRouter.routerDelegate.navigatorKey.currentContext).fold(
        () => TaskEither<Object, Option<T>>(
          () async =>
              left('Error when searching for context - navigation service'),
        ),
        (final BuildContext context) => TaskEither<Object, Option<T>>.tryCatch(
          () async => optionOf(
            await showModalBottomSheet<T>(
              context: context,
              builder: (final _) => widget,
            ),
          ),
          (final Object error, final _) => error,
        ),
      );
}
