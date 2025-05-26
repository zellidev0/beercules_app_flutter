import 'dart:async';

import 'package:beercules/common/constants.dart';
import 'package:beercules/services/ad_service/implementation/ad_mob_ad_service.dart';
import 'package:beercules/services/ad_service/implementation/no_op_ad_service.dart';
import 'package:beercules/ui/screens/game/services/game_ad_service.dart';
import 'package:beercules/ui/screens/home/services/home_ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdServiceAggregator implements GameAdService, HomeAdService {
  Future<void> init();
}

class AdService extends AdServiceAggregator {
  // TODO: make final
  late AdServiceAggregator internalAdService;

  AdService() {
    if (kIsWeb || !Constants.adsEnabled) {
      internalAdService = NoOpAdService();
    } else {
      internalAdService = AdMobAdService();
    }
  }

  @override
  Future<BannerAd?> getBannerAd() => internalAdService.getBannerAd();

  @override
  Future<BannerAd?> getCardAd() => internalAdService.getCardAd();

  @override
  Future<void> init() => internalAdService.init();

  @override
  Future<void> resetTrackingConsent() =>
      internalAdService.resetTrackingConsent();
}
