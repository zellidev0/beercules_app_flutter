import 'package:beercules/common.dart';
import 'package:beercules/customize/customize_card.dart';
import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/customize/customize_model.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizeView extends ConsumerWidget {
  const CustomizeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CustomizeController controller =
        ref.read(providers.customizeController.notifier);
    final CustomizeModel model = ref.read(providers.customizeController);
    return ScaffoldWidget(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: _buildTopRow(
              controller: controller,
              context: context,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (_, index) => CustomizeCard(
                  cardKey: model.configCards
                      .where((element) => !element.isBasicRule)
                      .toList()[index]
                      .key,
                  onTap: () => controller.showModal(
                    cardKey: model.configCards
                        .where((element) => !element.isBasicRule)
                        .toList()[index]
                        .key,
                    context: context,
                    widget: const CardDetailsView(),
                  ),
                ),
                itemCount: model.configCards
                    .where((element) => !element.isBasicRule)
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
    required CustomizeController controller,
    required BuildContext context,
  }) =>
      Row(
        children: [
          buildIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          const Spacer(),
          buildIconButton(
            onPressed: () => controller.restoreDefault(context: context),
            icon: Icons.restore,
          ),
        ],
      );
}

class CardDetailsView extends ConsumerWidget {
  const CardDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CustomizeController controller =
        ref.read(providers.customizeController.notifier);
    CustomizeModel model = ref.watch(providers.customizeController);
    return GestureDetector(
      onTap: () => controller.pop(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildCardForeground(
            onTap: () => controller.pop(),
            card: model.configCards
                .firstWhere((element) => element.key == model.selectedCardKey),
            context: context,
          ),
          Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: controller.modifyCardAmount,
                  child: Text(
                    model.configCards
                        .firstWhere(
                            (element) => element.key == model.selectedCardKey)
                        .amount
                        .toString(),
                    style: Theme.of(context).textTheme.bodyText2,
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
