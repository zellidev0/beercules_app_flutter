import 'package:beercules/common.dart';
import 'package:beercules/customize/customize_card.dart';
import 'package:beercules/customize/customize_controller.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizeView extends ConsumerWidget {
  const CustomizeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CustomizeController controller =
        ref.read(providers.customizeController.notifier);
    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTopRow(controller: controller),
            const SizedBox(height: 16),
            Flexible(
              child: GridView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (_, index) => CustomizeCard(
                  cardKey: controller.beerculesCards
                      .where((element) => !element.isBasicRule)
                      .toList()[index]
                      .key,
                  onTapUp: (TapUpDetails details) {},
                  onTapDown: (TapDownDetails details) {},
                ),
                itemCount: controller.beerculesCards
                    .where((element) => !element.isBasicRule)
                    .toList()
                    .length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow({
    required CustomizeController controller,
  }) =>
      Row(
        children: [
          buildIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          const Spacer(),
        ],
      );
}
