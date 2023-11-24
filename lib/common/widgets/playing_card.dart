import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PlayingCard extends StatelessWidget {
  final VoidCallback _onTap;
  final bool _showLogo;
  final String _resourceKey;
  final bool _showSkullAnimation;
  const PlayingCard({
    required final void Function() onTap,
    required final bool showLogo,
    required final String resourceKey,
    final bool showSkullAnimation = false,
    super.key,
  })  : _showSkullAnimation = showSkullAnimation,
        _resourceKey = resourceKey,
        _showLogo = showLogo,
        _onTap = onTap;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayingCardContainer(
              onTap: _onTap,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(72, 0, 72, 16),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: _showSkullAnimation
                          ? Lottie.asset('assets/lotties/skull_animation.json')
                          : _showLogo
                              ? Image.asset('assets/images/logo.png')
                              : SvgPicture.asset(
                                  'assets/instructions/${_resourceKey}_pic.svg',
                                ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      'game_view.instructions.$_resourceKey.title',
                      style: TextStyles.header2,
                    ).tr(),
                  ),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    'game_view.instructions.$_resourceKey.description'.tr(),
                    maxLines: 10,
                    style: TextStyles.body1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
