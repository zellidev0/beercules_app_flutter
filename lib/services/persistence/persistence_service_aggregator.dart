import 'package:beercules/ui/screens/customize/services/customize_persistence_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';

abstract class PersistenceServiceAggregator
    implements CustomizePersistenceService, GamePersistenceService {
  PersistenceServiceAggregator();
}
