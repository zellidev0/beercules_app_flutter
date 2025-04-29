import 'dart:async';
import 'dart:core';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:beercules/ui/screens/customize/customize_state.dart';
import 'package:beercules/ui/screens/customize/customize_view.dart';
import 'package:beercules/ui/screens/customize/services/customize_persistence_service.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomizeControllerImplementation extends CustomizeCubit {
  StreamSubscription<List<CustomizePersistenceServiceModelCard>>?
      persistenceServiceSubscription;
  NavigationService navigationService;
  CustomizePersistenceService persistenceService;

  @override
  CustomizeControllerImplementation({
    required this.navigationService,
    required this.persistenceService,
  }) : super(
          CustomizeState(
            selectedCardType: null,
            configCards: <CustomizeModelCard>[],
          ),
        ) {
    persistenceServiceSubscription = persistenceService.configCardsChangeStream
        .listen((List<CustomizePersistenceServiceModelCard> updatedCards) {
      emit(
        state.copyWith(
          configCards: updatedCards
              .whereNot((_) => _.type.isBasicRule())
              .map(
                (CustomizePersistenceServiceModelCard card) =>
                    CustomizeModelCard(
                  type: card.type,
                  amount: card.amount,
                ),
              )
              .toList(),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    unawaited(persistenceServiceSubscription?.cancel());
    return super.close();
  }

  @override
  void goBackToHome() => navigationService.goBack();

  @override
  void setSelectedCard({
    required BeerculesCardType cardType,
  }) {
    emit(state.copyWith(selectedCardType: cardType));
  }

  @override
  void setCardAmount(int amount) {
    persistenceService
      ..modifyConfigGameCardsAmount(
        cardType: state.selectedCardType,
        amount: amount,
      )
      ..resetToConfig();
  }

  @override
  void restoreDefault() {
    persistenceService.resetToDefaultCards();
    navigationService.showSnackBar(
      LocaleKeys.config_view_restoredDefault.tr(),
    );
  }

  @override
  void closeCardAmountChangeDialog() {
    navigationService.pop<void>();
  }
}
