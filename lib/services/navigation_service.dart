import 'dart:async';

import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/landing/landing_view.dart';
import 'package:beercules/navigation_service.dart';
import 'package:beercules/rules/rules_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_service.g.dart';

abstract interface class NavigationService {
  void closeDialog<T>({required final T? data});
  void goBack({final Uri? fallbackUri});
  void navigateToNamed(final String uri);
  void pop<T>({final T? data});
  void push(final String uri);
  void replaceWith(final Uri uri);
  void replaceWithNamed(final Uri uri);
  void reset(final Uri uri);
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter goRouter(final GoRouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: NavigationServiceRoutes.homeRouteUri.toString(),
    navigatorKey: rootNavigatorKey,
    onException: (
      final BuildContext context,
      final GoRouterState state,
      final GoRouter router,
    ) {
      debugPrint('GoRouter exception: ${state.error}');
    },
    routes: <RouteBase>[
      GoRoute(
        path: NavigationServiceRoutes.homeRouteUri.toString(),
        builder: (final BuildContext context, final __) => Consumer(
          builder: (final _, final WidgetRef ref, final __) {
            return const HomeView();
          },
        ),
      ),
      GoRoute(
        path: NavigationServiceRoutes.gameRouteUri.toString(),
        builder: (final BuildContext context, final __) => Consumer(
          builder: (final _, final WidgetRef ref, final __) {
            return const GameView();
          },
        ),
      ),
      GoRoute(
        path: NavigationServiceRoutes.rulesRouteUri.toString(),
        builder: (final BuildContext context, final __) => Consumer(
          builder: (final _, final WidgetRef ref, final __) {
            return const RulesView();
          },
        ),
      ),
      GoRoute(
        path: NavigationServiceRoutes.customizeRouteUri.toString(),
        builder: (final BuildContext context, final __) => Consumer(
          builder: (final _, final WidgetRef ref, final __) {
            return const CustomizeView();
          },
        ),
      ),
      GoRoute(
        path: NavigationServiceRoutes.landingRouteUri.toString(),
        builder: (final BuildContext context, final __) => Consumer(
          builder: (final _, final WidgetRef ref, final __) {
            return const LandingView();
          },
        ),
      ),
    ],
  );
}

@riverpod
NavigationService navigationService(final NavigationServiceRef ref) =>
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
      reset(fallbackUri);
    }
  }

  @override
  void navigateToNamed(final String uri) => push(uri);

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
  void reset(final Uri uri) => _goRouter.go(uri.toString());

  // @override
  // TaskEither<Object, Option<T>> showPopup<T>({required final Widget popup}) =>
  //     optionOf(_goRouter.routerDelegate.navigatorKey.currentContext).fold(
  //       () => TaskEither<Object, Option<T>>(
  //         () async =>
  //             left('Error when searching for context - navigation service'),
  //       ),
  //       (final BuildContext context) => TaskEither<Object, Option<T>>.tryCatch(
  //         () async => optionOf(
  //           await showDialog<T>(
  //             context: context,
  //             builder: (final _) => popup,
  //           ),
  //         ),
  //         (final Object error, final _) => error,
  //       ),
  //     );

  // @override
  // void showSnackBar({required final String message}) =>
  //     optionOf(_goRouter.routerDelegate.navigatorKey.currentContext).fold(
  //       () {},
  //       (final BuildContext context) =>
  //           ScaffoldMessenger.of(context).showSnackBar(
  //         buildHomodeaSnackBar(message: message),
  //       ),
  //     );
}
