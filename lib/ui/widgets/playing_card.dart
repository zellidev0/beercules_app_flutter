// ignore_for_file: use_colored_box

import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/common/beercules_card_type.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/ui/screens/game/widgets/game_view_card_ad.dart';
import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'playing_card.freezed.dart';

class PlayingCard extends StatelessWidget {
  final VoidCallback _onTap;
  final bool _showLogo;
  final BeerculesCardType cartType;
  final bool _isLastVictimGlass;
  final PlayingCardSpecialImage? cardSpecialImage;
  const PlayingCard({
    required void Function() onTap,
    required bool showLogo,
    required BeerculesCardType cardType,
    bool isLastVictimGlass = false,
    super.key,
    this.cardSpecialImage,
  }) : _isLastVictimGlass = isLastVictimGlass,
       cartType = cardType,
       _showLogo = showLogo,
       _onTap = onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        PlayingCardContainer(
          onTap: _onTap,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(72, 12, 72, 16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child:
                      cardSpecialImage == null
                          ? cartType.asset()
                          : cardSpecialImage!.map(
                            lastVictimGlass:
                                (final _) =>
                                    Assets.lotties.skullAnimation.lottie(),
                            showLogo: (final _) => Assets.images.logo.image(),
                            adsAdsAds: (final addd) {
                              final ad = addd.bannerAd;
                              if (ad == null) {
                                return Assets.images.logo.image();
                              }
                              return GameViewCardAd(ad: ad);
                            },
                          ),
                ),
              ),
              const SizedBox(height: 16),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  cartType.localizedTitle(
                    isLastVictimGlass: _isLastVictimGlass,
                  ),
                  style: TextStyles.header2,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: AutoSizeText(
                  cartType.localizedDescription(
                    isLastVictimGlass: isLastVictimGlass(),
                  ),
                  maxLines: 10,
                  style: TextStyles.body1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  bool isLastVictimGlass() =>
      cardSpecialImage is PlayingCardSpecialImageLastVictimGlass;
}

@freezed
class PlayingCardSpecialImage with _$PlayingCardSpecialImage {
  const factory PlayingCardSpecialImage.lastVictimGlass() =
      PlayingCardSpecialImageLastVictimGlass;
  const factory PlayingCardSpecialImage.showLogo() =
      PlayingCardSpecialImageShowLogo;
  const factory PlayingCardSpecialImage.adsAdsAds({
    required final BannerAd? bannerAd,
  }) = PlayingCardSpecialImageAdsAdsAds;
}
