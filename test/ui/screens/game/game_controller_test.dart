// ignore_for_file: lines_longer_than_80_chars

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/ui/screens/game/game_controller.dart';
import 'package:beercules/ui/screens/game/services/game_navigation_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGameNavigationService extends Mock implements GameNavigationService {}

class MockGamePersistenceService extends Mock
    implements GamePersistenceService {}

void main() {
  late GameControllerImplementation gameController;
  late MockGameNavigationService mockNavigationService;
  late MockGamePersistenceService mockPersistenceService;

  setUp(() async {
    mockNavigationService = MockGameNavigationService();
    mockPersistenceService = MockGamePersistenceService();
    gameController = ProviderContainer().read(
      gameControllerImplementationProvider(
        navigationService: mockNavigationService,
        persistenceService: mockPersistenceService,
      ).notifier,
    );
    final KeepAliveLink keepAliveLink = gameController.ref.keepAlive();
    addTearDown(keepAliveLink.close);
  });

  test('countCardsInGame should return correct count', () {
    final GamePersistenceServiceGame activeGame = GamePersistenceServiceGame(
      cardToAmountMapping: const <BeerculesCardType, int>{
        BeerculesCardType.basicRule1: 2,
        BeerculesCardType.basicRule2: 3,
        BeerculesCardType.basicRule3: 1,
      },
    );

    final int? count = gameController.countCardsInGame(activeGame);

    expect(count, 6);
  });

  group('should show game dialog', () async {
    test(
      'should return false when only default game exists',
      () {
        expect(
          gameController.shouldShowGameDialog(
            activeGame: null,
            customGame: null,
            defaultGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
          ),
          isFalse,
        );
      },
    );
    test(
      'should return false when active game is default game and custom game does not exist',
      () {
        expect(
          gameController.shouldShowGameDialog(
            activeGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            customGame: null,
            defaultGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
          ),
          isFalse,
        );
      },
    );
    test(
      'should return false when active game is default game and custom game is default',
      () {
        expect(
          gameController.shouldShowGameDialog(
            activeGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            customGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            defaultGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
          ),
          isFalse,
        );
      },
    );
    test(
      'should return true when active game is default game and custom game exists',
      () {
        expect(
          gameController.shouldShowGameDialog(
            activeGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            customGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            defaultGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
          ),
          isTrue,
        );
      },
    );
    test(
      'should return false when active game is custom game and custom game exists',
      () {
        expect(
          gameController.shouldShowGameDialog(
            activeGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            customGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            defaultGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
          ),
          isFalse,
        );
      },
    );
  });
}
