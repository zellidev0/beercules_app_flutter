import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/customize/customize_view.dart';
import 'package:beercules/services/navigation_service/implementation/go_router_navigation_service.dart';
import 'package:beercules/services/persistence/implementation/persistence_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customize_providers.g.dart';

@riverpod
CustomizeController customizeController(final CustomizeControllerRef ref) =>
    ref.watch(
      customizeControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
      ).notifier,
    );

@riverpod
CustomizeModel customizeModel(final CustomizeModelRef ref) => ref.watch(
      customizeControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
        persistenceService: ref.watch(persistenceServiceProvider),
      ),
    );
