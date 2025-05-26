import 'dart:async';

import 'package:beercules/services/ad_service/ad_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'
    hide ConsentInformation, ConsentStatus;

class NoOpAdService extends AdServiceAggregator {
  @override
  Future<BannerAd?> getBannerAd() async => null;

  @override
  Future<BannerAd?> getCardAd() async => null;

  @override
  Future<void> init() async {}

  @override
  Future<void> resetTrackingConsent() async {}
}
