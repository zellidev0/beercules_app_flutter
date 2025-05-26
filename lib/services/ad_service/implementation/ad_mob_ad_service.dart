import 'dart:async';
import 'dart:io';

import 'package:beercules/services/ad_service/ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    // var info = await ConsentInformation.instance.getConsentStatus();
    // ConsentInformation.instance.requestConsentInfoUpdate(
    //   ConsentRequestParameters(
    //     tagForUnderAgeOfConsent: false,
    //   ),
    //   () {
    //     debugPrint('ConsentInformation request failed');
    //   },
    //   (final _) {
    //     debugPrint('ConsentInformation request failed');
    //   },
    // );

    // if (info.consentStatus == ConsentStatus.required) {
    //   info = await UserMessagingPlatform.instance.showConsentForm();
    // }
  }

  @override
  Future<void> resetTrackingConsent() async {
    // await UserMessagingPlatform.instance.resetConsentInfo();
    await initTrackingConsent();
  }

  @override
  Future<BannerAd> getBannerAd() async {
    final ad = BannerAd(
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
    final ad = BannerAd(
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
