import 'package:beercules/services/persistence/persistence_service_model.dart';
import 'package:beercules/ui/screens/customize/services/customize_persistence_service.dart';
import 'package:beercules/ui/screens/game/services/game_persistence_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PersistenceServiceAggregator
    extends StateNotifier<PersistenceServiceModel>
    implements CustomizePersistenceService, GamePersistenceService {
  PersistenceServiceAggregator(super._state);
}
