import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomizeCard extends StatelessWidget {
  final String _cardKey;
  final GestureTapUpCallback _onTapUp;
  final GestureTapDownCallback _onTapDown;
  final VoidCallback _onTap;

  const CustomizeCard({
    required String cardKey,
    required GestureTapUpCallback onTapUp,
    required GestureTapDownCallback onTapDown,
    required VoidCallback onTap,
    Key? key,
  })  : _cardKey = cardKey,
        _onTapUp = onTapUp,
        _onTapDown = onTapDown,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/instructions/${_cardKey}_pic.svg",
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
            "game_view.instructions.$_cardKey.title",
            style: TextStyles.body4,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).tr(),
        ],
      ),
    );
  }
}
