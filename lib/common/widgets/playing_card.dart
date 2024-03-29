import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/theme.dart';

import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  final VoidCallback _onTap;
  final bool _showLogo;
  final BeerculesCardType cartType;
  final bool _isLastVictimGlass;
  const PlayingCard({
    required final void Function() onTap,
    required final bool showLogo,
    required final BeerculesCardType cardType,
    final bool isLastVictimGlass = false,
    super.key,
  })  : _isLastVictimGlass = isLastVictimGlass,
        cartType = cardType,
        _showLogo = showLogo,
        _onTap = onTap;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayingCardContainer(
              onTap: _onTap,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _isLastVictimGlass
                          ? Assets.lotties.skullAnimation.lottie()
                          : _showLogo
                              ? Assets.images.logo.image()
                              : cartType.asset(),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      cartType.localizedTitle(
                        isLastVictimGlass: _isLastVictimGlass,
                      ),
                      style: TextStyles.header2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    cartType.localizedDescription(
                      isLastVictimGlass: _isLastVictimGlass,
                    ),
                    maxLines: 10,
                    style: TextStyles.body1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
