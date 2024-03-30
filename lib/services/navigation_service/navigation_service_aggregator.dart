import 'package:beercules/services/navigation_service/general_navigation_service.dart';
import 'package:beercules/ui/screens/customize/services/customize_navigation_service.dart';
import 'package:beercules/ui/screens/game/services/game_navigation_service.dart';
import 'package:beercules/ui/screens/home/services/home_navigation_service.dart';

abstract class NavigationServiceAggregator
    implements
        GeneralNavigationService,
        CustomizeNavigationService,
        GameNavigationService,
        HomeNavigationService {}
