import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:beercules/ui/screens/home/home_controller.dart';
import 'package:beercules/ui/screens/home/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  group('HomeControllerImplementation', () {
    late MockHomeNavigationService mockNavigationService;

    setUp(() {
      mockNavigationService = MockHomeNavigationService();
    });

    HomeController createTestController() => ProviderContainer().read(
          homeControllerImplementationProvider(
            navigationService: mockNavigationService,
          ).notifier,
        );

    test('goToGameView should push game route', () {
      createTestController().goToGameView();
      verify(mockNavigationService.push(NavigationServiceRoutes.gameRouteUri))
          .called(1);
    });

    test('goToRulesView should push rules route', () {
      createTestController().goToRulesView();
      verify(mockNavigationService.push(NavigationServiceRoutes.rulesRouteUri))
          .called(1);
    });

    test('goToCustomizeView should push customize route', () {
      createTestController().goToCustomizeView();
      verify(
        mockNavigationService.push(NavigationServiceRoutes.customizeRouteUri),
      ).called(1);
    });

    test('showModalLegalNotice should show legal notice modal', () async {
      provideDummy(TaskEither<Object, Option<void>>.left(''));
      when(mockNavigationService.showModal<void>(any)).thenReturn(
        TaskEither<Object, Option<void>>.of(const None()),
      );
      createTestController().showModalLegalNotice();
      verify(mockNavigationService.showModal<void>(any)).called(1);
    });
  });
}
