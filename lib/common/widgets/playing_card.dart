import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/common/widgets/playing_card_container.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard({
    required this.onTap,
    required this.showLogo,
    required this.resourceKey,
    this.showSkullAnimation = false,
    super.key,
  });
  final VoidCallback onTap;
  final bool showLogo;
  final String resourceKey;
  final bool showSkullAnimation;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayingCardContainer(
              onTap: onTap,
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
            ),
          ],
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap))
      ..add(DiagnosticsProperty<bool>('showSkullAnimation', showSkullAnimation))
      ..add(StringProperty('resourceKey', resourceKey))
      ..add(DiagnosticsProperty<bool>('showLogo', showLogo));
  }
}
