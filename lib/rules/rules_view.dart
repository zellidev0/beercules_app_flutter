import 'package:beercules/common/widgets/basic_card.dart';
import 'package:beercules/common/widgets/bc_button.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildTopRow(navigationService: navigationService),
            BasicCard(
              onTap: null,
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
            BcButton.text(
              onPressed: () => navigationService.push(
                NavigationServiceRoutes.gameRouteUri,
              ),
              textResource: 'rules_view.go_to_game',
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTopRow({
    required final NavigationService navigationService,
  }) =>
      Row(
        children: <Widget>[
          BcButton(
            onPressed: navigationService.goBack,
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          const Spacer(),
        ],
      );
}
