import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/screens/customize/customize_model.dart';
import 'package:beercules/ui/widgets/playing_card.dart';
import 'package:flutter/material.dart';

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
