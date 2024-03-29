import 'package:beercules/customize/services/customize_navigation_service.dart';
import 'package:beercules/game/services/game_navigation_service.dart';
import 'package:beercules/home/services/home_navigation_service.dart';
import 'package:beercules/services/navigation_service/general_navigation_service.dart';

abstract interface class NavigationServiceAggregator
    implements
        GeneralNavigationService,
        CustomizeNavigationService,
        GameNavigationService,
        HomeNavigationService {}
