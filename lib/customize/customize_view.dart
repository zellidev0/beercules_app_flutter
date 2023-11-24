import 'package:beercules/common/widgets/basic_card.dart';
import 'package:beercules/common/widgets/bc_icon_button.dart';
import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/customize/widgets/customize_card.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:beercules/theme.dart';
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
            padding: const EdgeInsets.all(24).copyWith(bottom: 0),
            child: _buildTopRow(
              controller: controller,
              context: context,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5 / 3.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
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
          BcIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          const Spacer(),
          BcIconButton(
            onPressed: () => controller.restoreDefault(context: context),
            icon: Icons.restore,
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
      child: Padding(
        padding: const EdgeInsets.all(24),
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
            const SizedBox(height: 32),
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
                      style: TextStyles.header3.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 64, color: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
