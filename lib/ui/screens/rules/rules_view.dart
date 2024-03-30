import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/services/navigation_service/navigation_service_aggregator.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RulesView extends StatelessWidget {
  const RulesView({super.key});

  @override
  Widget build(final BuildContext context) => ScaffoldWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: BeerculesIconButton(
                onPressed: BlocProvider.of<NavigationServiceAggregator>(context)
                    .goBack,
                icon: Icons.arrow_back_ios_rounded,
              ),
            ),
            PlayingCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    LocaleKeys.rules_view_title,
                    style: TextStyles.header2,
                  ).tr(),
                  const SizedBox(height: 32),
                  const Text(
                    LocaleKeys.rules_view_rule_1_title,
                    style: TextStyles.header3,
                  ).tr(),
                  const SizedBox(height: 4),
                  const Text(
                    LocaleKeys.rules_view_rule_1_description,
                    style: TextStyles.body4,
                  ).tr(),
                  const SizedBox(height: 24),
                  const Text(
                    LocaleKeys.rules_view_rule_2_title,
                    style: TextStyles.header3,
                  ).tr(),
                  const SizedBox(height: 4),
                  const Text(
                    LocaleKeys.rules_view_rule_2_description,
                    style: TextStyles.body4,
                  ).tr(),
                  const SizedBox(height: 24),
                  const Text(
                    LocaleKeys.rules_view_rule_3_title,
                    style: TextStyles.header3,
                  ).tr(),
                  const SizedBox(height: 4),
                  const Text(
                    LocaleKeys.rules_view_rule_3_description,
                    style: TextStyles.body4,
                  ).tr(),
                ],
              ),
            ),
            BeerculesButton(
              onPressed: () =>
                  BlocProvider.of<NavigationServiceAggregator>(context).push(
                NavigationServiceRoutes.gameRouteUri,
              ),
              text: LocaleKeys.rules_view_go_to_game.tr(),
            ),
          ],
        ),
      );
}
