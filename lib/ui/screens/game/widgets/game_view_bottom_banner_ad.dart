import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameViewBottomBannerAd extends StatelessWidget {
  const GameViewBottomBannerAd({
    required this.ad,
    super.key,
  });

  final BannerAd ad;

  @override
  Widget build(final BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: AdSize.fullBanner.width.toDouble(),
          height: AdSize.fullBanner.height.toDouble(),
          child: AdWidget(ad: ad),
        ),
      );
}
