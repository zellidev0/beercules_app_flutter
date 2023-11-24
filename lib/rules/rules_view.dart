import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/common/widgets/bc_icon_button.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/services/navigation_service/navigation_service.dart';
import 'package:beercules/services/navigation_service/navigation_service_routes.dart';

import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RulesView extends ConsumerWidget {
  const RulesView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final NavigationService navigationService =
        ref.read(navigationServiceProvider);

    return ScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: BcIconButton(
              onPressed: navigationService.goBack,
              icon: Icons.arrow_back_ios_rounded,
            ),
          ),
          PlayingCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'rules_view.title',
                  style: TextStyles.header2,
                ).tr(),
                const SizedBox(height: 32),
                const Text(
                  'rules_view.rule_1_title',
                  style: TextStyles.header3,
                ).tr(),
                const SizedBox(height: 4),
                const Text(
                  'rules_view.rule_1_description',
                  style: TextStyles.body4,
                ).tr(),
                const SizedBox(height: 24),
                const Text(
                  'rules_view.rule_2_title',
                  style: TextStyles.header3,
                ).tr(),
                const SizedBox(height: 4),
                const Text(
                  'rules_view.rule_2_description',
                  style: TextStyles.body4,
                ).tr(),
                const SizedBox(height: 24),
                const Text(
                  'rules_view.rule_3_title',
                  style: TextStyles.header3,
                ).tr(),
                const SizedBox(height: 4),
                const Text(
                  'rules_view.rule_3_description',
                  style: TextStyles.body4,
                ).tr(),
              ],
            ),
          ),
          BcButton(
            onPressed: () => navigationService.push(
              NavigationServiceRoutes.gameRouteUri,
            ),
            textResource: 'rules_view.go_to_game',
          ),
        ],
      ),
    );
  }
}
