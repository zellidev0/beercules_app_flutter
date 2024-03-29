import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';

abstract class CustomizeControllerInterface
    extends StateNotifier<CustomizeModel> {
  CustomizeControllerInterface(super._state);

  void goBackToHome();
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  });
  void modifyCardAmount();
  void restoreDefault();
  void pop();
}
