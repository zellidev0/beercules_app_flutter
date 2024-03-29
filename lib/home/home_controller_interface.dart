import 'package:beercules/home/home_model.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';

abstract class HomeControllerInterface extends StateNotifier<HomeModel> {
  HomeControllerInterface(super._state);

  void goToCustomizeView();
  void goToGameView();
  void goToRulesView();
  void showModalLegalNotice({required final Widget widget});
}
