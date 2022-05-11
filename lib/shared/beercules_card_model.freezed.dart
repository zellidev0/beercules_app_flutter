// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beercules_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BeerculesCardTearOff {
  const _$BeerculesCardTearOff();

  _BeerculesCard call(
      {required String key,
      required int amount,
      required bool isBasicRule,
      required bool isVictimGlass}) {
    return _BeerculesCard(
      key: key,
      amount: amount,
      isBasicRule: isBasicRule,
      isVictimGlass: isVictimGlass,
    );
  }
}

/// @nodoc
const $BeerculesCard = _$BeerculesCardTearOff();

/// @nodoc
mixin _$BeerculesCard {
  String get key => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  bool get isBasicRule => throw _privateConstructorUsedError;
  bool get isVictimGlass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerculesCardCopyWith<BeerculesCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerculesCardCopyWith<$Res> {
  factory $BeerculesCardCopyWith(
          BeerculesCard value, $Res Function(BeerculesCard) then) =
      _$BeerculesCardCopyWithImpl<$Res>;
  $Res call({String key, int amount, bool isBasicRule, bool isVictimGlass});
}

/// @nodoc
class _$BeerculesCardCopyWithImpl<$Res>
    implements $BeerculesCardCopyWith<$Res> {
  _$BeerculesCardCopyWithImpl(this._value, this._then);

  final BeerculesCard _value;
  // ignore: unused_field
  final $Res Function(BeerculesCard) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? amount = freezed,
    Object? isBasicRule = freezed,
    Object? isVictimGlass = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      isBasicRule: isBasicRule == freezed
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: isVictimGlass == freezed
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BeerculesCardCopyWith<$Res>
    implements $BeerculesCardCopyWith<$Res> {
  factory _$BeerculesCardCopyWith(
          _BeerculesCard value, $Res Function(_BeerculesCard) then) =
      __$BeerculesCardCopyWithImpl<$Res>;
  @override
  $Res call({String key, int amount, bool isBasicRule, bool isVictimGlass});
}

/// @nodoc
class __$BeerculesCardCopyWithImpl<$Res>
    extends _$BeerculesCardCopyWithImpl<$Res>
    implements _$BeerculesCardCopyWith<$Res> {
  __$BeerculesCardCopyWithImpl(
      _BeerculesCard _value, $Res Function(_BeerculesCard) _then)
      : super(_value, (v) => _then(v as _BeerculesCard));

  @override
  _BeerculesCard get _value => super._value as _BeerculesCard;

  @override
  $Res call({
    Object? key = freezed,
    Object? amount = freezed,
    Object? isBasicRule = freezed,
    Object? isVictimGlass = freezed,
  }) {
    return _then(_BeerculesCard(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      isBasicRule: isBasicRule == freezed
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: isVictimGlass == freezed
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BeerculesCard with DiagnosticableTreeMixin implements _BeerculesCard {
  _$_BeerculesCard(
      {required this.key,
      required this.amount,
      required this.isBasicRule,
      required this.isVictimGlass});

  @override
  final String key;
  @override
  final int amount;
  @override
  final bool isBasicRule;
  @override
  final bool isVictimGlass;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeerculesCard(key: $key, amount: $amount, isBasicRule: $isBasicRule, isVictimGlass: $isVictimGlass)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeerculesCard'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('isBasicRule', isBasicRule))
      ..add(DiagnosticsProperty('isVictimGlass', isVictimGlass));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BeerculesCard &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.isBasicRule, isBasicRule) &&
            const DeepCollectionEquality()
                .equals(other.isVictimGlass, isVictimGlass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(isBasicRule),
      const DeepCollectionEquality().hash(isVictimGlass));

  @JsonKey(ignore: true)
  @override
  _$BeerculesCardCopyWith<_BeerculesCard> get copyWith =>
      __$BeerculesCardCopyWithImpl<_BeerculesCard>(this, _$identity);
}

abstract class _BeerculesCard implements BeerculesCard {
  factory _BeerculesCard(
      {required String key,
      required int amount,
      required bool isBasicRule,
      required bool isVictimGlass}) = _$_BeerculesCard;

  @override
  String get key;
  @override
  int get amount;
  @override
  bool get isBasicRule;
  @override
  bool get isVictimGlass;
  @override
  @JsonKey(ignore: true)
  _$BeerculesCardCopyWith<_BeerculesCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeerculesPlayCardTearOff {
  const _$BeerculesPlayCardTearOff();

  _BeerculesPlayCard call(
      {required String id,
      required String key,
      required bool played,
      required bool isBasicRule,
      required bool isVictimGlass}) {
    return _BeerculesPlayCard(
      id: id,
      key: key,
      played: played,
      isBasicRule: isBasicRule,
      isVictimGlass: isVictimGlass,
    );
  }
}

/// @nodoc
const $BeerculesPlayCard = _$BeerculesPlayCardTearOff();

/// @nodoc
mixin _$BeerculesPlayCard {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  bool get played => throw _privateConstructorUsedError;
  bool get isBasicRule => throw _privateConstructorUsedError;
  bool get isVictimGlass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerculesPlayCardCopyWith<BeerculesPlayCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerculesPlayCardCopyWith<$Res> {
  factory $BeerculesPlayCardCopyWith(
          BeerculesPlayCard value, $Res Function(BeerculesPlayCard) then) =
      _$BeerculesPlayCardCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String key,
      bool played,
      bool isBasicRule,
      bool isVictimGlass});
}

/// @nodoc
class _$BeerculesPlayCardCopyWithImpl<$Res>
    implements $BeerculesPlayCardCopyWith<$Res> {
  _$BeerculesPlayCardCopyWithImpl(this._value, this._then);

  final BeerculesPlayCard _value;
  // ignore: unused_field
  final $Res Function(BeerculesPlayCard) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? played = freezed,
    Object? isBasicRule = freezed,
    Object? isVictimGlass = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      played: played == freezed
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
      isBasicRule: isBasicRule == freezed
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: isVictimGlass == freezed
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BeerculesPlayCardCopyWith<$Res>
    implements $BeerculesPlayCardCopyWith<$Res> {
  factory _$BeerculesPlayCardCopyWith(
          _BeerculesPlayCard value, $Res Function(_BeerculesPlayCard) then) =
      __$BeerculesPlayCardCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String key,
      bool played,
      bool isBasicRule,
      bool isVictimGlass});
}

/// @nodoc
class __$BeerculesPlayCardCopyWithImpl<$Res>
    extends _$BeerculesPlayCardCopyWithImpl<$Res>
    implements _$BeerculesPlayCardCopyWith<$Res> {
  __$BeerculesPlayCardCopyWithImpl(
      _BeerculesPlayCard _value, $Res Function(_BeerculesPlayCard) _then)
      : super(_value, (v) => _then(v as _BeerculesPlayCard));

  @override
  _BeerculesPlayCard get _value => super._value as _BeerculesPlayCard;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? played = freezed,
    Object? isBasicRule = freezed,
    Object? isVictimGlass = freezed,
  }) {
    return _then(_BeerculesPlayCard(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      played: played == freezed
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
      isBasicRule: isBasicRule == freezed
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: isVictimGlass == freezed
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BeerculesPlayCard
    with DiagnosticableTreeMixin
    implements _BeerculesPlayCard {
  _$_BeerculesPlayCard(
      {required this.id,
      required this.key,
      required this.played,
      required this.isBasicRule,
      required this.isVictimGlass});

  @override
  final String id;
  @override
  final String key;
  @override
  final bool played;
  @override
  final bool isBasicRule;
  @override
  final bool isVictimGlass;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeerculesPlayCard(id: $id, key: $key, played: $played, isBasicRule: $isBasicRule, isVictimGlass: $isVictimGlass)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeerculesPlayCard'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('played', played))
      ..add(DiagnosticsProperty('isBasicRule', isBasicRule))
      ..add(DiagnosticsProperty('isVictimGlass', isVictimGlass));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BeerculesPlayCard &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.played, played) &&
            const DeepCollectionEquality()
                .equals(other.isBasicRule, isBasicRule) &&
            const DeepCollectionEquality()
                .equals(other.isVictimGlass, isVictimGlass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(played),
      const DeepCollectionEquality().hash(isBasicRule),
      const DeepCollectionEquality().hash(isVictimGlass));

  @JsonKey(ignore: true)
  @override
  _$BeerculesPlayCardCopyWith<_BeerculesPlayCard> get copyWith =>
      __$BeerculesPlayCardCopyWithImpl<_BeerculesPlayCard>(this, _$identity);
}

abstract class _BeerculesPlayCard implements BeerculesPlayCard {
  factory _BeerculesPlayCard(
      {required String id,
      required String key,
      required bool played,
      required bool isBasicRule,
      required bool isVictimGlass}) = _$_BeerculesPlayCard;

  @override
  String get id;
  @override
  String get key;
  @override
  bool get played;
  @override
  bool get isBasicRule;
  @override
  bool get isVictimGlass;
  @override
  @JsonKey(ignore: true)
  _$BeerculesPlayCardCopyWith<_BeerculesPlayCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BeerculesCardProviderModelTearOff {
  const _$BeerculesCardProviderModelTearOff();

  _BeerculesCardProviderModel call(
      {required List<BeerculesPlayCard> currentGameCards,
      required List<BeerculesCard> configCards}) {
    return _BeerculesCardProviderModel(
      currentGameCards: currentGameCards,
      configCards: configCards,
    );
  }
}

/// @nodoc
const $BeerculesCardProviderModel = _$BeerculesCardProviderModelTearOff();

/// @nodoc
mixin _$BeerculesCardProviderModel {
  List<BeerculesPlayCard> get currentGameCards =>
      throw _privateConstructorUsedError;
  List<BeerculesCard> get configCards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerculesCardProviderModelCopyWith<BeerculesCardProviderModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerculesCardProviderModelCopyWith<$Res> {
  factory $BeerculesCardProviderModelCopyWith(BeerculesCardProviderModel value,
          $Res Function(BeerculesCardProviderModel) then) =
      _$BeerculesCardProviderModelCopyWithImpl<$Res>;
  $Res call(
      {List<BeerculesPlayCard> currentGameCards,
      List<BeerculesCard> configCards});
}

/// @nodoc
class _$BeerculesCardProviderModelCopyWithImpl<$Res>
    implements $BeerculesCardProviderModelCopyWith<$Res> {
  _$BeerculesCardProviderModelCopyWithImpl(this._value, this._then);

  final BeerculesCardProviderModel _value;
  // ignore: unused_field
  final $Res Function(BeerculesCardProviderModel) _then;

  @override
  $Res call({
    Object? currentGameCards = freezed,
    Object? configCards = freezed,
  }) {
    return _then(_value.copyWith(
      currentGameCards: currentGameCards == freezed
          ? _value.currentGameCards
          : currentGameCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesPlayCard>,
      configCards: configCards == freezed
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ));
  }
}

/// @nodoc
abstract class _$BeerculesCardProviderModelCopyWith<$Res>
    implements $BeerculesCardProviderModelCopyWith<$Res> {
  factory _$BeerculesCardProviderModelCopyWith(
          _BeerculesCardProviderModel value,
          $Res Function(_BeerculesCardProviderModel) then) =
      __$BeerculesCardProviderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BeerculesPlayCard> currentGameCards,
      List<BeerculesCard> configCards});
}

/// @nodoc
class __$BeerculesCardProviderModelCopyWithImpl<$Res>
    extends _$BeerculesCardProviderModelCopyWithImpl<$Res>
    implements _$BeerculesCardProviderModelCopyWith<$Res> {
  __$BeerculesCardProviderModelCopyWithImpl(_BeerculesCardProviderModel _value,
      $Res Function(_BeerculesCardProviderModel) _then)
      : super(_value, (v) => _then(v as _BeerculesCardProviderModel));

  @override
  _BeerculesCardProviderModel get _value =>
      super._value as _BeerculesCardProviderModel;

  @override
  $Res call({
    Object? currentGameCards = freezed,
    Object? configCards = freezed,
  }) {
    return _then(_BeerculesCardProviderModel(
      currentGameCards: currentGameCards == freezed
          ? _value.currentGameCards
          : currentGameCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesPlayCard>,
      configCards: configCards == freezed
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ));
  }
}

/// @nodoc

class _$_BeerculesCardProviderModel
    with DiagnosticableTreeMixin
    implements _BeerculesCardProviderModel {
  _$_BeerculesCardProviderModel(
      {required this.currentGameCards, required this.configCards});

  @override
  final List<BeerculesPlayCard> currentGameCards;
  @override
  final List<BeerculesCard> configCards;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BeerculesCardProviderModel(currentGameCards: $currentGameCards, configCards: $configCards)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BeerculesCardProviderModel'))
      ..add(DiagnosticsProperty('currentGameCards', currentGameCards))
      ..add(DiagnosticsProperty('configCards', configCards));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BeerculesCardProviderModel &&
            const DeepCollectionEquality()
                .equals(other.currentGameCards, currentGameCards) &&
            const DeepCollectionEquality()
                .equals(other.configCards, configCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentGameCards),
      const DeepCollectionEquality().hash(configCards));

  @JsonKey(ignore: true)
  @override
  _$BeerculesCardProviderModelCopyWith<_BeerculesCardProviderModel>
      get copyWith => __$BeerculesCardProviderModelCopyWithImpl<
          _BeerculesCardProviderModel>(this, _$identity);
}

abstract class _BeerculesCardProviderModel
    implements BeerculesCardProviderModel {
  factory _BeerculesCardProviderModel(
          {required List<BeerculesPlayCard> currentGameCards,
          required List<BeerculesCard> configCards}) =
      _$_BeerculesCardProviderModel;

  @override
  List<BeerculesPlayCard> get currentGameCards;
  @override
  List<BeerculesCard> get configCards;
  @override
  @JsonKey(ignore: true)
  _$BeerculesCardProviderModelCopyWith<_BeerculesCardProviderModel>
      get copyWith => throw _privateConstructorUsedError;
}
