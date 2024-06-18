import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class GameAdService {
  Future<BannerAd> getBannerAd();
  Future<BannerAd> getCardAd();
}
