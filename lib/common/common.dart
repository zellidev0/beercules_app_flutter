import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/common/widgets/bacis_card.dart';
import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

Widget buildButton({
  required final VoidCallback? onPressed,
  required final String textResource,
}) =>
    BcButton(
      onPressed: onPressed,
      child: Text(
        textResource,
        style: TextStyles.body2,
      ).tr(),
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

Widget buildIconButtonWithText({
  required final VoidCallback onPressed,
  required final String textResource,
  required final IconData icon,
}) =>
    BcButton(
      onPressed: onPressed,
      child: Text(
        textResource,
        style: TextStyles.body1,
      ).tr(),
    );

Widget buildCardForeground({
  required final BuildContext context,
  required final VoidCallback onTap,
  required final bool showLogo,
  required final String resourceKey,
  required final bool showSkullAnimation,
}) =>
    BasicCard(
      onTap: onTap,
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
            child: AspectRatio(
              aspectRatio: 1,
              child: showSkullAnimation
                  ? Lottie.asset('assets/lotties/skull_animation.json')
                  : showLogo
                      ? Image.asset('assets/images/logo.png')
                      : SvgPicture.asset(
                          'assets/instructions/${resourceKey}_pic.svg',
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
    );
