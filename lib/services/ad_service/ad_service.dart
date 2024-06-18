import 'dart:async';

import 'package:beercules/ui/screens/game/services/game_ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_service.g.dart';

abstract class AdServiceAggregator implements GameAdService {
  Future<void> init();
}

@Riverpod(keepAlive: true)
AdServiceAggregator adService(
  final AdServiceRef ref,
) =>
    AdMobAdService();

class AdMobAdService extends AdServiceAggregator {
  static const String adMobBannerAdUnitId =
      'ca-app-pub-3940256099942544/6300978111';
  static const String adMobCardAdUnitId =
      'ca-app-pub-3940256099942544/6300978111';
  static const String adMobBannerAdUnitIdTesting =
      'ca-app-pub-3940256099942544/6300978111';
  static const String adMobCardAdUnitIdTesting =
      'ca-app-pub-3940256099942544/6300978111';
  final String bannerAdUnitId =
      kReleaseMode ? adMobBannerAdUnitId : adMobBannerAdUnitIdTesting;
  final String cardAdUnitId =
      kReleaseMode ? adMobCardAdUnitId : adMobCardAdUnitIdTesting;

  @override
  Future<void> init() async => MobileAds.instance.initialize();

  @override
  Future<BannerAd> getBannerAd() async {
    final BannerAd ad = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdFailedToLoad: (final Ad ad, final LoadAdError error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );
    await ad.load();
    return ad;
  }

  @override
  Future<BannerAd> getCardAd() async {
    final BannerAd ad = BannerAd(
      size: AdSize.mediumRectangle,
      adUnitId: cardAdUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdFailedToLoad: (final Ad ad, final LoadAdError error) {
          debugPrint('CardAd failed to load: $error');
          ad.dispose();
        },
      ),
    );
    await ad.load();
    return ad;
  }
}
