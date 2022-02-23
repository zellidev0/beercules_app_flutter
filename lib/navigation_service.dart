import 'package:beercules_flutter/main.dart';

class NavigationService {
  static const String homeRouteUri = '/home';
  static const String gameRouteUri = '/game';

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
