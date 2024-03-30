// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameControllerImplementationHash() =>
    r'fe3096cd5db1c3a352d16d06307edb06bc968574';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GameControllerImplementation
    extends BuildlessAutoDisposeNotifier<GameModel> {
  late final GameNavigationService navigationService;
  late final GamePersistenceService persistenceService;

  GameModel build({
    required GameNavigationService navigationService,
    required GamePersistenceService persistenceService,
  });
}

/// See also [GameControllerImplementation].
@ProviderFor(GameControllerImplementation)
const gameControllerImplementationProvider =
    GameControllerImplementationFamily();

/// See also [GameControllerImplementation].
class GameControllerImplementationFamily extends Family<GameModel> {
  /// See also [GameControllerImplementation].
  const GameControllerImplementationFamily();

  /// See also [GameControllerImplementation].
  GameControllerImplementationProvider call({
    required GameNavigationService navigationService,
    required GamePersistenceService persistenceService,
  }) {
    return GameControllerImplementationProvider(
      navigationService: navigationService,
      persistenceService: persistenceService,
    );
  }

  @override
  GameControllerImplementationProvider getProviderOverride(
    covariant GameControllerImplementationProvider provider,
  ) {
    return call(
      navigationService: provider.navigationService,
      persistenceService: provider.persistenceService,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gameControllerImplementationProvider';
}

/// See also [GameControllerImplementation].
class GameControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<GameControllerImplementation,
        GameModel> {
  /// See also [GameControllerImplementation].
  GameControllerImplementationProvider({
    required GameNavigationService navigationService,
    required GamePersistenceService persistenceService,
  }) : this._internal(
          () => GameControllerImplementation()
            ..navigationService = navigationService
            ..persistenceService = persistenceService,
          from: gameControllerImplementationProvider,
          name: r'gameControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameControllerImplementationHash,
          dependencies: GameControllerImplementationFamily._dependencies,
          allTransitiveDependencies:
              GameControllerImplementationFamily._allTransitiveDependencies,
          navigationService: navigationService,
          persistenceService: persistenceService,
        );

  GameControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
    required this.persistenceService,
  }) : super.internal();

  final GameNavigationService navigationService;
  final GamePersistenceService persistenceService;

  @override
  GameModel runNotifierBuild(
    covariant GameControllerImplementation notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(GameControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameControllerImplementationProvider._internal(
        () => create()
          ..navigationService = navigationService
          ..persistenceService = persistenceService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationService: navigationService,
        persistenceService: persistenceService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GameControllerImplementation, GameModel>
      createElement() {
    return _GameControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameControllerImplementationProvider &&
        other.navigationService == navigationService &&
        other.persistenceService == persistenceService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, persistenceService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameControllerImplementationRef
    on AutoDisposeNotifierProviderRef<GameModel> {
  /// The parameter `navigationService` of this provider.
  GameNavigationService get navigationService;

  /// The parameter `persistenceService` of this provider.
  GamePersistenceService get persistenceService;
}

class _GameControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<GameControllerImplementation,
        GameModel> with GameControllerImplementationRef {
  _GameControllerImplementationProviderElement(super.provider);

  @override
  GameNavigationService get navigationService =>
      (origin as GameControllerImplementationProvider).navigationService;
  @override
  GamePersistenceService get persistenceService =>
      (origin as GameControllerImplementationProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
