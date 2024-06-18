import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameViewCardAd extends StatelessWidget {
  const GameViewCardAd({
    required this.ad,
    super.key,
  });

  final BannerAd ad;

  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: AdWidget(ad: ad),
          ),
        ),
      );
}
