import 'package:beercules/game/game_controller.dart';
import 'package:beercules/game/game_model.dart';
import 'package:beercules/game/game_view.dart';
import 'package:beercules/services/navigation_service/implementation/go_router_navigation_service.dart';
import 'package:beercules/services/persistence/implementation/persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_providers.g.dart';

@riverpod
GameController gameController(final GameControllerRef ref) => ref.watch(
      gameControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
      ).notifier,
    );

@riverpod
GameModel gameModel(final GameModelRef ref) => ref.watch(
      gameControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
      ),
    );
