import 'dart:math';

import 'package:beercules/services/ad_service/ad_service.dart';
import 'package:beercules/services/navigation_service/implementation/go_router_navigation_service.dart';
import 'package:beercules/services/persistence/implementation/persistence_service.dart';
import 'package:beercules/ui/screens/game/game_controller.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/screens/game/game_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_providers.g.dart';

@riverpod
GameController gameController(final GameControllerRef ref) => ref.watch(
      gameControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
        adService: ref.watch(adServiceProvider),
      ).notifier,
    );

@riverpod
GameModel gameModel(final GameModelRef ref) => ref.watch(
      gameControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
        adService: ref.watch(adServiceProvider),
      ),
    );

@riverpod
int cardTransformationSeed(final _) => Random().nextInt(10);
