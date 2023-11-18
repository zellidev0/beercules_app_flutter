import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

void showSnackbar({
  required final BuildContext context,
  required final String message,
  final Duration duration = const Duration(seconds: 3),
}) {
  final SnackBar snackBar = SnackBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    content: Text(message),
    duration: duration,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget buildButton({
  required final VoidCallback? onPressed,
  required final String textResource,
}) =>
    _buildButton(
      child: Text(
        textResource,
        style: TextStyles.body2,
      ).tr(),
      onPressed: onPressed,
    );

List<T> shuffle<T>(final int seed, final List<T> items) {
  final Random random = Random(seed);
  for (int i = items.length - 1; i > 0; i--) {
    final int n = random.nextInt(i + 1);
    final T temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

Widget buildIconButton({
  required final VoidCallback onPressed,
  required final IconData icon,
}) =>
    _buildButton(
      child: Icon(icon),
      onPressed: onPressed,
    );

Widget buildIconButtonWithText({
  required final VoidCallback onPressed,
  required final String textResource,
  required final IconData icon,
}) =>
    _buildButton(
      child: Text(
        textResource,
        style: TextStyles.body1,
      ).tr(),
      onPressed: onPressed,
    );

Widget buildBasicCard({
  required final Widget child,
  required final VoidCallback? onTap,
  required final Color color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.5 / 3.5,
                  child: ColoredBox(
                    color: color,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Future<void> buildAndShowDialog({
  required final BuildContext context,
  required final VoidCallback onConfirmPressed,
  required final VoidCallback onCancelPressed,
  required final String confirmTextResource,
  required final String headerResource,
  required final String descriptionResource,
  required final String declineTextResource,
}) async {
  await showDialog<void>(
    useSafeArea: false,
    context: context,
    builder: (final _) => Material(
      color: Colors.black.withAlpha(100),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background.withAlpha(255),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                    ),
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
  required final VoidCallback onConfirmPressed,
  required final VoidCallback onCancelPressed,
  required final String confirmTextResource,
  required final String declineTextResource,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
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
  required final BuildContext context,
  required final VoidCallback onTap,
  required final bool showLogo,
  required final String resourceKey,
  required final bool showSkullAnimation,
}) =>
    buildBasicCard(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
            child: AspectRatio(
              aspectRatio: 1,
              child: showSkullAnimation
                  ? Lottie.asset('assets/lotties/skull_animation.json')
                  : _getForegroundPic(
                      imageKey: resourceKey,
                      showLogo: showLogo,
                    ),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              'game_view.instructions.$resourceKey.title',
              style: TextStyles.header2,
            ).tr(),
          ),
          const SizedBox(height: 16),
          AutoSizeText(
            'game_view.instructions.$resourceKey.description'.tr(),
            maxLines: 10,
            style: TextStyles.body1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      onTap: onTap,
      color: Theme.of(context).colorScheme.primary,
    );

Widget _getForegroundPic({
  required final String imageKey,
  required final bool showLogo,
}) =>
    showLogo
        ? Image.asset('assets/images/logo.png')
        : SvgPicture.asset('assets/instructions/${imageKey}_pic.svg');

Widget _buildButton({
  required final Widget child,
  required final VoidCallback? onPressed,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
