import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomizeCard extends StatelessWidget {
  final String _cardKey;
  final VoidCallback _onTap;

  const CustomizeCard({
    required final String cardKey,
    required final VoidCallback onTap,
    super.key,
  })  : _cardKey = cardKey,
        _onTap = onTap;

  @override
  Widget build(final BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: BeerculesColors.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SvgPicture.asset(
                      'assets/instructions/${_cardKey}_pic.svg',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    'game_view.instructions.$_cardKey.title',
                    style: TextStyles.body5,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
      );
}
