import 'dart:async';

import 'package:beercules/services/navigation_service/navigation_service_aggregator.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

class GoRouterNavigationService extends NavigationServiceAggregator {
  final GoRouter _goRouter;

  GoRouterNavigationService({
    required final GoRouter goRouter,
  }) : _goRouter = goRouter;

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
