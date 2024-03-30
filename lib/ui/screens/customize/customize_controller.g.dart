// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customize_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customizeControllerImplementationHash() =>
    r'10800b4e069fde6b1801762fec3d6a8939d3e1bf';

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

abstract class _$CustomizeControllerImplementation
    extends BuildlessAutoDisposeNotifier<CustomizeModel> {
  late final CustomizeNavigationService navigationService;
  late final CustomizePersistenceService persistenceService;

  CustomizeModel build({
    required CustomizeNavigationService navigationService,
    required CustomizePersistenceService persistenceService,
  });
}

/// See also [CustomizeControllerImplementation].
@ProviderFor(CustomizeControllerImplementation)
const customizeControllerImplementationProvider =
    CustomizeControllerImplementationFamily();

/// See also [CustomizeControllerImplementation].
class CustomizeControllerImplementationFamily extends Family<CustomizeModel> {
  /// See also [CustomizeControllerImplementation].
  const CustomizeControllerImplementationFamily();

  /// See also [CustomizeControllerImplementation].
  CustomizeControllerImplementationProvider call({
    required CustomizeNavigationService navigationService,
    required CustomizePersistenceService persistenceService,
  }) {
    return CustomizeControllerImplementationProvider(
      navigationService: navigationService,
      persistenceService: persistenceService,
    );
  }

  @override
  CustomizeControllerImplementationProvider getProviderOverride(
    covariant CustomizeControllerImplementationProvider provider,
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
  String? get name => r'customizeControllerImplementationProvider';
}

/// See also [CustomizeControllerImplementation].
class CustomizeControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<CustomizeControllerImplementation,
        CustomizeModel> {
  /// See also [CustomizeControllerImplementation].
  CustomizeControllerImplementationProvider({
    required CustomizeNavigationService navigationService,
    required CustomizePersistenceService persistenceService,
  }) : this._internal(
          () => CustomizeControllerImplementation()
            ..navigationService = navigationService
            ..persistenceService = persistenceService,
          from: customizeControllerImplementationProvider,
          name: r'customizeControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customizeControllerImplementationHash,
          dependencies: CustomizeControllerImplementationFamily._dependencies,
          allTransitiveDependencies: CustomizeControllerImplementationFamily
              ._allTransitiveDependencies,
          navigationService: navigationService,
          persistenceService: persistenceService,
        );

  CustomizeControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
    required this.persistenceService,
  }) : super.internal();

  final CustomizeNavigationService navigationService;
  final CustomizePersistenceService persistenceService;

  @override
  CustomizeModel runNotifierBuild(
    covariant CustomizeControllerImplementation notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
      persistenceService: persistenceService,
    );
  }

  @override
  Override overrideWith(CustomizeControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: CustomizeControllerImplementationProvider._internal(
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
  AutoDisposeNotifierProviderElement<CustomizeControllerImplementation,
      CustomizeModel> createElement() {
    return _CustomizeControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomizeControllerImplementationProvider &&
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

mixin CustomizeControllerImplementationRef
    on AutoDisposeNotifierProviderRef<CustomizeModel> {
  /// The parameter `navigationService` of this provider.
  CustomizeNavigationService get navigationService;

  /// The parameter `persistenceService` of this provider.
  CustomizePersistenceService get persistenceService;
}

class _CustomizeControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<
        CustomizeControllerImplementation,
        CustomizeModel> with CustomizeControllerImplementationRef {
  _CustomizeControllerImplementationProviderElement(super.provider);

  @override
  CustomizeNavigationService get navigationService =>
      (origin as CustomizeControllerImplementationProvider).navigationService;
  @override
  CustomizePersistenceService get persistenceService =>
      (origin as CustomizeControllerImplementationProvider).persistenceService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
