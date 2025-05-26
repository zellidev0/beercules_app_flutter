import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:flutter/material.dart';

class CustomizeCard extends StatelessWidget {
  final BeerculesCardType cardType;
  final VoidCallback onTap;

  const CustomizeCard({
    required this.cardType,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlayingCardContainer(
        padding: const EdgeInsets.all(16),
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 1,
                child: cardType.asset(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Text(
                cardType.localizedTitle(isLastVictimGlass: false),
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
