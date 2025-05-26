import 'dart:async';

import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

class GoRouterNavigationService extends NavigationService {
  final GoRouter _goRouter;

  GoRouterNavigationService({
    required GoRouter goRouter,
  }) : _goRouter = goRouter;

  @override
  void goBack({Uri? fallbackUri}) {
    if (_goRouter.canPop()) {
      _goRouter.pop();
    } else if (fallbackUri != null) {
      _goRouter.go(fallbackUri.toString());
    }
  }

  @override
  void pop<T>({T? data}) => _goRouter.pop(data);

  @override
  void push(String uri) => unawaited(_goRouter.push(uri));

  @override
  void replaceWith(Uri uri) => unawaited(
        _goRouter.pushReplacement(uri.toString()),
      );

  @override
  void replaceWithNamed(Uri uri) => unawaited(
        _goRouter.replace(uri.toString()),
      );

  @override
  Future<T?> showPopup<T>(Widget popup) => showDialog<T>(
        context: _goRouter.routerDelegate.navigatorKey.currentContext ??
            (throw Exception('No context found')),
        builder: (_) => popup,
      );

  @override
  void showSnackBar(String message) =>
      optionOf(_goRouter.routerDelegate.navigatorKey.currentContext).fold(
        () {},
        (BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        ),
      );

  @override
  Future<T?> showModal<T>(Widget widget) => showModalBottomSheet<T>(
        context: _goRouter.routerDelegate.navigatorKey.currentContext!,
        builder: (_) => widget,
      );
}
