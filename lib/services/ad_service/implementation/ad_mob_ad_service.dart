import 'dart:async';
import 'dart:io';

import 'package:beercules/services/ad_service/ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'
    hide ConsentInformation, ConsentStatus;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_messaging_platform/user_messaging_platform.dart';

part 'ad_mob_ad_service.g.dart';

@Riverpod(keepAlive: true)
AdServiceAggregator adMobAdService(
  final AdMobAdServiceRef ref,
) =>
    AdMobAdService();

class AdMobAdService extends AdServiceAggregator {
  static const String adMobBannerAdUnitIdAndroid =
      'ca-app-pub-2447211869280891/5877235250';
  static const String adMobCardAdUnitIdAndroid =
      'ca-app-pub-2447211869280891/4218676830';

  static const String adMobBannerAdUnitIdIos =
      'ca-app-pub-2447211869280891/8449565883';
  static const String adMobCardAdUnitIdIos =
      'ca-app-pub-2447211869280891/8641137575';

  static const String adMobBannerAdUnitIdTesting =
      'ca-app-pub-3940256099942544/6300978111';
  static const String adMobCardAdUnitIdTesting =
      'ca-app-pub-3940256099942544/6300978111';
  final String bannerAdUnitId =
      Platform.isAndroid ? adMobBannerAdUnitIdAndroid : adMobBannerAdUnitIdIos;
  final String cardAdUnitId =
      Platform.isAndroid ? adMobCardAdUnitIdAndroid : adMobCardAdUnitIdIos;

  @override
  Future<void> init() async {
    await initTrackingConsent();
    await MobileAds.instance.initialize();
  }

  Future<void> initTrackingConsent() async {
    ConsentInformation info =
        await UserMessagingPlatform.instance.requestConsentInfoUpdate();

    if (info.consentStatus == ConsentStatus.required) {
      info = await UserMessagingPlatform.instance.showConsentForm();
    }
  }

  @override
  Future<void> resetTrackingConsent() async {
    await UserMessagingPlatform.instance.resetConsentInfo();
    await initTrackingConsent();
  }

  @override
  Future<BannerAd> getBannerAd() async {
    final BannerAd ad = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: kReleaseMode ? bannerAdUnitId : adMobBannerAdUnitIdTesting,
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
      adUnitId: kReleaseMode ? cardAdUnitId : adMobCardAdUnitIdTesting,
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
