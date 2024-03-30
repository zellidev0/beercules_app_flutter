import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/screens/home/home_model.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final HomeController controller;
  const HomeView({
    required this.controller,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ListenableBuilder(
        listenable: controller,
        builder: (final _, final __) => ScaffoldWidget(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: BeerculesIconButton(
                  onPressed: controller.showModalLegalNotice,
                  icon: Icons.info,
                ),
              ),
              Column(
                children: <Widget>[
                  const Text(
                    LocaleKeys.home_view_title,
                    style: TextStyles.header1,
                  ).tr(),
                  const SizedBox(height: 8),
                  const Text(
                    LocaleKeys.home_view_sub_title,
                    style: TextStyles.header3,
                  ).tr(),
                  const SizedBox(height: 32),
                  Assets.images.logo.image(),
                  const SizedBox(height: 32),
                  BeerculesButton(
                    text: LocaleKeys.home_view_button_go_drinking.tr(),
                    onPressed: controller.goToGameView,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: BeerculesButton(
                          text: LocaleKeys.home_view_button_rules.tr(),
                          onPressed: controller.goToRulesView,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: BeerculesButton(
                          text: LocaleKeys.home_view_button_customize.tr(),
                          onPressed: controller.goToCustomizeView,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      );
}

abstract class HomeController extends ChangeNotifier {
  HomeModel get model;
  void goToCustomizeView();
  void goToGameView();
  void goToRulesView();
  void showModalLegalNotice();
}
