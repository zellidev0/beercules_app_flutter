import 'package:beercules/common/widgets/bacis_card.dart';
import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/customize/customize_card.dart';
import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizeView extends ConsumerWidget {
  const CustomizeView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final CustomizeController controller =
        ref.read(providers.customizeController.notifier);
    final CustomizeModel model = ref.read(providers.customizeController);
    return ScaffoldWidget(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: _buildTopRow(
              controller: controller,
              context: context,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (final _, final int index) => CustomizeCard(
                  cardKey: model.configCards
                      .where(
                        (final BeerculesCard element) => !element.isBasicRule,
                      )
                      .toList()[index]
                      .key,
                  onTap: () async => controller.showModal<void>(
                    cardKey: model.configCards
                        .where(
                          (final BeerculesCard element) => !element.isBasicRule,
                        )
                        .toList()[index]
                        .key,
                    context: context,
                    widget: const CardDetailsView(),
                  ),
                ),
                itemCount: model.configCards
                    .where(
                      (final BeerculesCard element) => !element.isBasicRule,
                    )
                    .toList()
                    .length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRow({
    required final CustomizeController controller,
    required final BuildContext context,
  }) =>
      Row(
        children: <Widget>[
          BcButton(
            onPressed: controller.goBackToHome,
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          const Spacer(),
          BcButton(
            onPressed: () => controller.restoreDefault(context: context),
            child: const Icon(Icons.restore),
          ),
        ],
      );
}

class CardDetailsView extends ConsumerWidget {
  const CardDetailsView({
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final CustomizeController controller =
        ref.read(providers.customizeController.notifier);
    final CustomizeModel model = ref.watch(providers.customizeController);
    final BeerculesCard selected = model.configCards.firstWhere(
      (final BeerculesCard element) => element.key == model.selectedCardKey,
    );
    return GestureDetector(
      onTap: controller.pop,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CardForeground(
            onTap: controller.pop,
            showLogo: selected.isBasicRule,
            resourceKey: selected.key,
            showSkullAnimation: false,
          ),
          ColoredBox(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: controller.modifyCardAmount,
                  child: Text(
                    model.configCards
                        .firstWhere(
                          (final BeerculesCard element) =>
                              element.key == model.selectedCardKey,
                        )
                        .amount
                        .toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 64, color: Colors.transparent),
        ],
      ),
    );
  }
}
