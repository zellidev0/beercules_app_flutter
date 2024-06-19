// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerImplementationHash() =>
    r'1f0ff969f8c30fa11bb61083724b6b53961a57cc';

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

abstract class _$HomeControllerImplementation
    extends BuildlessAutoDisposeNotifier<HomeModel> {
  late final HomeNavigationService navigationService;
  late final HomeAdService adService;

  HomeModel build({
    required HomeNavigationService navigationService,
    required HomeAdService adService,
  });
}

/// See also [HomeControllerImplementation].
@ProviderFor(HomeControllerImplementation)
const homeControllerImplementationProvider =
    HomeControllerImplementationFamily();

/// See also [HomeControllerImplementation].
class HomeControllerImplementationFamily extends Family<HomeModel> {
  /// See also [HomeControllerImplementation].
  const HomeControllerImplementationFamily();

  /// See also [HomeControllerImplementation].
  HomeControllerImplementationProvider call({
    required HomeNavigationService navigationService,
    required HomeAdService adService,
  }) {
    return HomeControllerImplementationProvider(
      navigationService: navigationService,
      adService: adService,
    );
  }

  @override
  HomeControllerImplementationProvider getProviderOverride(
    covariant HomeControllerImplementationProvider provider,
  ) {
    return call(
      navigationService: provider.navigationService,
      adService: provider.adService,
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
  String? get name => r'homeControllerImplementationProvider';
}

/// See also [HomeControllerImplementation].
class HomeControllerImplementationProvider
    extends AutoDisposeNotifierProviderImpl<HomeControllerImplementation,
        HomeModel> {
  /// See also [HomeControllerImplementation].
  HomeControllerImplementationProvider({
    required HomeNavigationService navigationService,
    required HomeAdService adService,
  }) : this._internal(
          () => HomeControllerImplementation()
            ..navigationService = navigationService
            ..adService = adService,
          from: homeControllerImplementationProvider,
          name: r'homeControllerImplementationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$homeControllerImplementationHash,
          dependencies: HomeControllerImplementationFamily._dependencies,
          allTransitiveDependencies:
              HomeControllerImplementationFamily._allTransitiveDependencies,
          navigationService: navigationService,
          adService: adService,
        );

  HomeControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
    required this.adService,
  }) : super.internal();

  final HomeNavigationService navigationService;
  final HomeAdService adService;

  @override
  HomeModel runNotifierBuild(
    covariant HomeControllerImplementation notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
      adService: adService,
    );
  }

  @override
  Override overrideWith(HomeControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeControllerImplementationProvider._internal(
        () => create()
          ..navigationService = navigationService
          ..adService = adService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationService: navigationService,
        adService: adService,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HomeControllerImplementation, HomeModel>
      createElement() {
    return _HomeControllerImplementationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeControllerImplementationProvider &&
        other.navigationService == navigationService &&
        other.adService == adService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);
    hash = _SystemHash.combine(hash, adService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeControllerImplementationRef
    on AutoDisposeNotifierProviderRef<HomeModel> {
  /// The parameter `navigationService` of this provider.
  HomeNavigationService get navigationService;

  /// The parameter `adService` of this provider.
  HomeAdService get adService;
}

class _HomeControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<HomeControllerImplementation,
        HomeModel> with HomeControllerImplementationRef {
  _HomeControllerImplementationProviderElement(super.provider);

  @override
  HomeNavigationService get navigationService =>
      (origin as HomeControllerImplementationProvider).navigationService;
  @override
  HomeAdService get adService =>
      (origin as HomeControllerImplementationProvider).adService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
