import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/theme.dart';
import 'package:flutter/material.dart';

class CustomizeCard extends StatelessWidget {
  final BeerculesCardType _cardType;
  final VoidCallback _onTap;

  const CustomizeCard({
    required final BeerculesCardType cardKey,
    required final VoidCallback onTap,
    super.key,
  })  : _cardType = cardKey,
        _onTap = onTap;

  @override
  Widget build(final BuildContext context) => PlayingCardContainer(
        padding: const EdgeInsets.all(16),
        onTap: _onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 1,
                child: _cardType.asset(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Text(
                _cardType.localizedTitle(isLastVictimGlass: false),
                style: TextStyles.body5,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
