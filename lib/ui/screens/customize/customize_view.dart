import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/constants.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/screens/customize/widgets/customize_card.dart';
import 'package:beercules/ui/widgets/beercules_icon_button.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';

class CustomizeView extends StatelessWidget {
  final CustomizeController controller;
  const CustomizeView({
    required this.controller,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ScaffoldWidget(
        padding: EdgeInsets.zero,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: SliverHeaderDelegateComponent(controller: controller),
            ),
            SliverPadding(
              padding: Constants.pagePadding.copyWith(top: 0),
              sliver: ListenableBuilder(
                listenable: controller,
                builder: (final _, final __) => SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5 / 3.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (final _, final int index) => CustomizeCard(
                    cardKey: controller.model.configCards[index].type,
                    onTap: () async => controller.showCard(
                      cardType: controller.model.configCards[index].type,
                      widget: CardDetailsView(
                        card: controller.model.configCards[index],
                        onTap: controller.pop,
                        onButtonTap: controller.modifyCardAmount,
                      ),
                    ),
                  ),
                  itemCount: controller.model.configCards.length,
                ),
              ),
            ),
          ],
        ),
      );
}

class CardDetailsView extends StatelessWidget {
  final VoidCallback _onTap;
  final VoidCallback _onButtonTap;
  final CustomizeModelCard _card;
  const CardDetailsView({
    required final VoidCallback onTap,
    required final VoidCallback onButtonTap,
    required final CustomizeModelCard card,
    super.key,
  })  : _onTap = onTap,
        _onButtonTap = onButtonTap,
        _card = card;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PlayingCard(
            onTap: _onTap,
            showLogo: _card.type.isBasicRule(),
            cardType: _card.type,
          ),
          FloatingActionButton(
            onPressed: _onButtonTap,
            child: Text(
              _card.amount.toString(),
              style: TextStyles.header3.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      );
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
            BeerculesIconButton(
              onPressed: controller.goBackToHome,
              icon: Icons.arrow_back_ios_rounded,
            ),
            BeerculesIconButton(
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

abstract class CustomizeController extends ChangeNotifier {
  CustomizeModel get model;
  void goBackToHome();
  void showCard({
    required final BeerculesCardType cardType,
    required final Widget widget,
  });
  void modifyCardAmount();
  void restoreDefault();
  void pop();
}
