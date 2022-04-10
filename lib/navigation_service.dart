import 'package:beercules/main.dart';

class NavigationService {
  static const String homeRouteUri = '/';
  static const String gameRouteUri = '/game';
  static const String rulesRouteUri = '/rules';

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

  Future<bool> pop() async => await globalBeamerDelegate.popRoute();

  Object? getCurrentRouteParam() =>
      globalBeamerDelegate.currentBeamLocation.data;
}
