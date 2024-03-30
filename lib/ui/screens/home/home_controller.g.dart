// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeControllerImplementationHash() =>
    r'5b5233541a0842035c107a1c3f460bd1c2fed84d';

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

  HomeModel build({
    required HomeNavigationService navigationService,
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
  }) {
    return HomeControllerImplementationProvider(
      navigationService: navigationService,
    );
  }

  @override
  HomeControllerImplementationProvider getProviderOverride(
    covariant HomeControllerImplementationProvider provider,
  ) {
    return call(
      navigationService: provider.navigationService,
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
  }) : this._internal(
          () => HomeControllerImplementation()
            ..navigationService = navigationService,
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
        );

  HomeControllerImplementationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.navigationService,
  }) : super.internal();

  final HomeNavigationService navigationService;

  @override
  HomeModel runNotifierBuild(
    covariant HomeControllerImplementation notifier,
  ) {
    return notifier.build(
      navigationService: navigationService,
    );
  }

  @override
  Override overrideWith(HomeControllerImplementation Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeControllerImplementationProvider._internal(
        () => create()..navigationService = navigationService,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        navigationService: navigationService,
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
        other.navigationService == navigationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, navigationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HomeControllerImplementationRef
    on AutoDisposeNotifierProviderRef<HomeModel> {
  /// The parameter `navigationService` of this provider.
  HomeNavigationService get navigationService;
}

class _HomeControllerImplementationProviderElement
    extends AutoDisposeNotifierProviderElement<HomeControllerImplementation,
        HomeModel> with HomeControllerImplementationRef {
  _HomeControllerImplementationProviderElement(super.provider);

  @override
  HomeNavigationService get navigationService =>
      (origin as HomeControllerImplementationProvider).navigationService;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
