import 'package:beercules/common/constants.dart';

import 'package:beercules/common/widgets/bc_icon_button.dart';
import 'package:beercules/common/widgets/playing_card.dart';
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
      padding: EdgeInsets.zero,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: SliverHeaderDelegateComponent(controller: controller),
          ),
          SliverPadding(
            padding: Constants.pagePadding.copyWith(top: 0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.5 / 3.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (final _, final int index) => CustomizeCard(
                cardKey: model.configCards[index].key,
                onTap: () async => controller.showCard(
                  cardKey: model.configCards[index].key,
                  widget: CardDetailsView(
                    onTap: controller.pop,
                    onButtonTap: controller.modifyCardAmount,
                  ),
                ),
              ),
              itemCount: model.configCards.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CardDetailsView extends ConsumerWidget {
  final VoidCallback _onTap;
  final VoidCallback _onButtonTap;
  const CardDetailsView({
    required final VoidCallback onTap,
    required final VoidCallback onButtonTap,
    super.key,
  })  : _onTap = onTap,
        _onButtonTap = onButtonTap;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final CustomizeModel model = ref.watch(providers.customizeController);
    final BeerculesCard selected = model.configCards.firstWhere(
      (final BeerculesCard element) => element.key == model.selectedCardKey,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PlayingCard(
          onTap: _onTap,
          showLogo: selected.isBasicRule,
          resourceKey: selected.key,
        ),
        FloatingActionButton(
          onPressed: _onButtonTap,
          child: Text(
            selected.amount.toString(),
            style: TextStyles.header3.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class SliverHeaderDelegateComponent extends SliverPersistentHeaderDelegate {
  final CustomizeController controller;

  const SliverHeaderDelegateComponent({
    required this.controller,
  });

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) =>
      Padding(
        padding: Constants.pagePadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BcIconButton(
              onPressed: controller.goBackToHome,
              icon: Icons.arrow_back_ios_rounded,
            ),
            BcIconButton(
              onPressed: controller.restoreDefault,
              icon: Icons.restore,
            ),
          ],
        ),
      );

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  double get _height => kToolbarHeight + Constants.pagePadding.top;

  @override
  bool shouldRebuild(final SliverPersistentHeaderDelegate oldDelegate) => true;
}
