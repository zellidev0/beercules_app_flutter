import 'dart:async';
import 'package:beercules/services/ad_service/implementation/ad_mob_ad_service.dart';
import 'package:beercules/services/ad_service/implementation/no_op_ad_service.dart';
import 'package:beercules/ui/screens/game/services/game_ad_service.dart';
import 'package:beercules/ui/screens/home/services/home_ad_service.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_service.g.dart';

abstract class AdServiceAggregator implements GameAdService, HomeAdService {
  Future<void> init();
}

@Riverpod(keepAlive: true)
AdServiceAggregator adService(
  final AdServiceRef ref,
) =>
    kIsWeb
        ? ref.watch(noOpAdServiceProvider)
        : ref.watch(adMobAdServiceProvider);
