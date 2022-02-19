import 'package:beercules_flutter/main.dart';

class NavigationService {
  static const String homeRouteUri = '/';
  static const String orderConfirmationRouteUri = '/confirmation';

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

  Future<void> pop() async => await globalBeamerDelegate.popRoute();

  Object? getCurrentRouteParam() =>
      globalBeamerDelegate.currentBeamLocation.data;
}
