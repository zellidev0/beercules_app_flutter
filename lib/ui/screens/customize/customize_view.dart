import 'dart:ui';

import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/constants.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/screens/customize/customize_providers.dart';
import 'package:beercules/ui/screens/customize/widgets/customize_card.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizeView extends ConsumerWidget {
  const CustomizeView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final CustomizeController controller =
        ref.read(customizeControllerProvider);
    final CustomizeModel model = ref.watch(customizeModelProvider);

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
              itemBuilder: (final _, final int index) => Opacity(
                opacity: model.cards[index].amount < 1 ? 0.5 : 1,
                child: CustomizeCard(
                  cardKey: model.cards[index].type,
                  onTap: () async => controller.showCard(
                    cardType: model.cards[index].type,
                    widget: CardDetailsView(
                      onTap: controller.pop,
                      onButtonTap: controller.modifyCardAmount,
                    ),
                  ),
                ),
              ),
              itemCount: model.cards.length,
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
    final CustomizeModel model = ref.watch(customizeModelProvider);
    final CustomizeModelCard selected = model.cards.firstWhere(
      (final CustomizeModelCard card) => card.type == model.selectedCardType,
    );
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlayingCard(
            onTap: _onTap,
            showLogo: selected.type.isBasicRule(),
            cardType: selected.type,
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
      ),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BeerculesIconButton(
            onPressed: controller.goBackToHome,
            icon: Icons.arrow_back_ios_rounded,
          ),
          BeerculesIconButton(
            onPressed: controller.restoreDefault,
            icon: Icons.restore,
          ),
        ],
      );

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  double get _height => kToolbarHeight + Constants.pagePadding.top;

  @override
  bool shouldRebuild(final SliverPersistentHeaderDelegate oldDelegate) => true;
}

abstract class CustomizeController {
  void goBackToHome();
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  });
  void modifyCardAmount();
  void restoreDefault();
  void pop();
}
