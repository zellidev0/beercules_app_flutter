import 'package:beercules/home/home_controller.dart';
import 'package:beercules/home/home_model.dart';
import 'package:beercules/home/home_view.dart';
import 'package:beercules/services/navigation_service/implementation/go_router_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@riverpod
HomeController homeController(final HomeControllerRef ref) => ref.watch(
      homeControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
      ).notifier,
    );

@riverpod
HomeModel homeModel(final HomeModelRef ref) => ref.watch(
      homeControllerImplementationProvider(
        navigationService: ref.watch(goRouterNavigationServiceProvider),
      ),
    );
