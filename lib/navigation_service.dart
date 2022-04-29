import 'package:beercules/main.dart';

class NavigationService {
  static const String homeRouteUri = '/home';
  static const String gameRouteUri = '/game';
  static const String rulesRouteUri = '/rules';
  static const String customizeRouteUri = '/customize';

  Future<void> navigateToNamed({
    required String uri,
    bool beamBackOnPop = true,
    Object? data,
  }) async =>
      globalBeamerDelegate.beamToNamed(
        uri,
        beamBackOnPop: beamBackOnPop,
        data: data,
      );

  bool beamBack() => globalBeamerDelegate.beamBack();
  Future<bool> pop() async => await globalBeamerDelegate.popRoute();
}
