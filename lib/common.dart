import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/shared/beercules_card_model.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showSnackbar({
  required BuildContext context,
  required String message,
  Duration duration = const Duration(seconds: 1),
}) {
  final snackBar = SnackBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    content: Text(message),
    duration: duration,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

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

Widget buildIconButtonWithText({
  required VoidCallback onPressed,
  required String textResource,
  required IconData icon,
}) =>
    _buildButton(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            textResource,
            style: TextStyles.body1,
          ).tr(),
        ],
      ),
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

Future<void> buildAndShowDialog({
  required BuildContext context,
  required VoidCallback onConfirmPressed,
  required VoidCallback onCancelPressed,
  required String confirmTextResource,
  required String headerResource,
  required String descriptionResource,
  required String declineTextResource,
}) async {
  await showDialog(
    useSafeArea: false,
    context: context,
    builder: (_) => Material(
      color: Colors.black.withAlpha(100),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.background.withAlpha(255),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        headerResource.tr(),
                        style: TextStyles.header2,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      descriptionResource.tr(),
                      style: TextStyles.body1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    _buildDialogButtons(
                      onConfirmPressed: onConfirmPressed,
                      onCancelPressed: onCancelPressed,
                      confirmTextResource: confirmTextResource,
                      declineTextResource: declineTextResource,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Row _buildDialogButtons({
  required VoidCallback onConfirmPressed,
  required VoidCallback onCancelPressed,
  required String confirmTextResource,
  required String declineTextResource,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: buildButton(
            onPressed: onConfirmPressed,
            textResource: confirmTextResource,
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: buildButton(
            onPressed: onCancelPressed,
            textResource: declineTextResource,
          ),
        ),
      ],
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
            AutoSizeText(
              "game_view.instructions.${card.key}.description".tr(),
              maxLines: 10,
              style: TextStyles.body1,
              textAlign: TextAlign.center,
            ),
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
