import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/ui/screens/game/game_controller.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/screens/game/services/game_navigation_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'game_controller_test.mocks.dart';

@GenerateMocks(<Type>[
  GameNavigationService,
  GamePersistenceService,
])
// ignore: unreachable_from_main
class GameControllerTestMocks {}

void main() {
  late MockGameNavigationService mockNavigationService;
  late MockGamePersistenceService mockPersistenceService;

  setUp(() async {
    mockNavigationService = MockGameNavigationService();
    mockPersistenceService = MockGamePersistenceService();
  });

  GameControllerImplementation createGameController() {
    final GameControllerImplementation gameController =
        ProviderContainer().read(
      gameControllerImplementationProvider(
        navigationService: mockNavigationService,
        persistenceService: mockPersistenceService,
        cardTransformSeed: 0,
      ).notifier,
    );
    final KeepAliveLink keepAliveLink = gameController.ref.keepAlive();
    addTearDown(keepAliveLink.close);
    return gameController;
  }

  test('countCardsInGame should return correct count', () {
    final GamePersistenceServiceGame activeGame = GamePersistenceServiceGame(
      cardToAmountMapping: const <BeerculesCardType, int>{
        BeerculesCardType.basicRule1: 2,
        BeerculesCardType.basicRule2: 3,
        BeerculesCardType.basicRule3: 1,
      },
    );

    final int? count = createGameController().countCardsInGame(activeGame);

    expect(count, 6);
  });

  group('should show game dialog', () {
    test(
      'should return false when only default game exists',
      () {
        expect(
          createGameController().shouldShowGameDialog(
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
      'should return false when active game is default game and '
      'custom game does not exist',
      () {
        expect(
          createGameController().shouldShowGameDialog(
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
      'should return false when active game is default game and '
      'custom game is default',
      () {
        expect(
          createGameController().shouldShowGameDialog(
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
      'should return true when active game is default game and '
      'custom game exists',
      () {
        expect(
          createGameController().shouldShowGameDialog(
            activeGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 2,
                BeerculesCardType.basicRule2: 3,
                BeerculesCardType.basicRule3: 1,
              },
            ),
            customGame: GamePersistenceServiceGame(
              cardToAmountMapping: const <BeerculesCardType, int>{
                BeerculesCardType.basicRule1: 3,
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
      'should return false when active game is custom game and '
      'custom game exists',
      () {
        expect(
          createGameController().shouldShowGameDialog(
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

  test('should update state with new cards', () {
    WidgetsFlutterBinding.ensureInitialized();
    final List<GameModelCard> cards = <GameModelCard>[
      GameModelCard(
        transformationAngle: 0,
        type: BeerculesCardType.basicRule1,
        wasPlayed: false,
        id: 'basicRule1_0',
      ),
      GameModelCard(
        transformationAngle: 1,
        type: BeerculesCardType.basicRule1,
        wasPlayed: false,
        id: 'basicRule1_1',
      ),
    ];
    final GameControllerImplementation gameController = createGameController()
      ..updateState(cards: cards);

    expect(gameController.state.cards, equals(cards));
    expect(
      gameController.state.amountOfCardsLeft,
      equals(cards.length),
    );
  });

  test('should count cards in game correctly', () {
    final GamePersistenceServiceGame activeGame = GamePersistenceServiceGame(
      cardToAmountMapping: const <BeerculesCardType, int>{
        BeerculesCardType.basicRule1: 2,
        BeerculesCardType.basicRule2: 3,
        BeerculesCardType.basicRule3: 1,
      },
    );

    final int? count = createGameController().countCardsInGame(activeGame);

    expect(count, equals(6));
  });

  test('should generate new default game', () async {
    final List<GameModelCard> cards = <GameModelCard>[
      GameModelCard(
        transformationAngle: 30,
        type: BeerculesCardType.basicRule1,
        wasPlayed: false,
        id: 'BeerculesCardType.basicRule10',
      ),
      GameModelCard(
        transformationAngle: 31,
        type: BeerculesCardType.basicRule1,
        wasPlayed: false,
        id: 'BeerculesCardType.basicRule11',
      ),
    ];

    when(mockPersistenceService.resetActiveGameToDefaultGame())
        .thenAnswer((final _) async {});
    when(mockPersistenceService.defaultGame()).thenReturn(
      GamePersistenceServiceGame(
        cardToAmountMapping: const <BeerculesCardType, int>{
          BeerculesCardType.basicRule1: 2,
        },
      ),
    );

    expect(
      await createGameController().newDefaultGame(),
      equals(cards),
    );
    verify(mockPersistenceService.resetActiveGameToDefaultGame()).called(1);
  });

  // test('should generate new custom game', () async {
  //   final List<GameModelCard> cards = <GameModelCard>[
  //     GameModelCard(
  //       transformationAngle: 0,
  //       type: BeerculesCardType.basicRule1,
  //       wasPlayed: false,
  //       id: 'basicRule1_0',
  //     ),
  //     GameModelCard(
  //       transformationAngle: 1,
  //       type: BeerculesCardType.basicRule1,
  //       wasPlayed: false,
  //       id: 'basicRule1_1',
  //     ),
  //   ];

  //   final GamePersistenceServiceGame customGame = GamePersistenceServiceGame(
  //     cardToAmountMapping: const <BeerculesCardType, int>{
  //       BeerculesCardType.basicRule1: 2,
  //     },
  //   );

  //   when(mockPersistenceService.resetActiveGameToCustomGame())
  //       .thenAnswer((final _) => Future<void>.value());

  //   final List<GameModelCard> newCards =
  //       await createGameController().newConfigGame(customGame);

  //   expect(newCards, equals(cards));
  // });

  test('should go back to home', () {
    when(mockNavigationService.goBack())
        .thenAnswer((final _) => Future<void>.value());
    createGameController().goBackToHome();

    verify(mockNavigationService.goBack()).called(1);
  });

  test('should pop', () {
    when(mockNavigationService.pop<void>())
        .thenAnswer((final _) => Future<void>.value());
    createGameController().pop();

    verify(mockNavigationService.pop<void>()).called(1);
  });
}
