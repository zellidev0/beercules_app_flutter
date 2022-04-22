import 'dart:math';

import 'package:beercules/shared/beercules_card_model.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildButton({
  required VoidCallback? onPressed,
  required String textResource,
}) =>
    _buildButton(
      child: Text(
        textResource,
        style: TextStyles.body1,
      ).tr(),
      onPressed: onPressed,
    );

List<T> shuffle<T>(List<T> items) {
  var random = Random();
  for (var i = items.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);
    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

Widget buildIconButton({
  required VoidCallback onPressed,
  required IconData icon,
}) =>
    _buildButton(
      child: Icon(icon),
      onPressed: onPressed,
    );

Widget buildBasicCard({
  required Widget child,
  required VoidCallback? onTap,
  required Color color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: 2.5 / 3.5,
                  child: Container(
                    color: color,
                    child: Padding(
                        padding: const EdgeInsets.all(32.0), child: child),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget buildCardForeground({
  required BuildContext context,
  required VoidCallback onTap,
  required BeerculesCard card,
}) =>
    buildBasicCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
              child: AspectRatio(
                aspectRatio: 1,
                child: _getForegroundPic(card: card),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "game_view.instructions.${card.key}.title",
                style: TextStyles.header2,
              ).tr(),
            ),
            const SizedBox(height: 16),
            Text(
              "game_view.instructions.${card.key}.description",
              style: TextStyles.body2,
              textAlign: TextAlign.center,
            ).tr(),
          ],
        ),
        onTap: onTap,
        color: Theme.of(context).colorScheme.primary);

Widget _getForegroundPic({
  required BeerculesCard card,
}) =>
    card.isBasicRule
        ? Image.asset("assets/images/logo.png")
        : SvgPicture.asset("assets/instructions/${card.key}_pic.svg");

Widget _buildButton({
  required Widget child,
  required VoidCallback? onPressed,
}) =>
    ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child,
        ));
