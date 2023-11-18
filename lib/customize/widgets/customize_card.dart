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
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/instructions/${_cardKey}_pic.svg',
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10000000),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _onTap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'game_view.instructions.$_cardKey.title',
              style: TextStyles.body4,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ).tr(),
          ],
        ),
      );
}
