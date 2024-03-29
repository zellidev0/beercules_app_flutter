// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beercules_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BeerculesCard {
  BeerculesCardType get key => throw _privateConstructorUsedError;
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
      _$BeerculesCardCopyWithImpl<$Res, BeerculesCard>;
  @useResult
  $Res call(
      {BeerculesCardType key,
      int amount,
      bool isBasicRule,
      bool isVictimGlass});
}

/// @nodoc
class _$BeerculesCardCopyWithImpl<$Res, $Val extends BeerculesCard>
    implements $BeerculesCardCopyWith<$Res> {
  _$BeerculesCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? amount = null,
    Object? isBasicRule = null,
    Object? isVictimGlass = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      isBasicRule: null == isBasicRule
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: null == isVictimGlass
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeerculesCardImplCopyWith<$Res>
    implements $BeerculesCardCopyWith<$Res> {
  factory _$$BeerculesCardImplCopyWith(
          _$BeerculesCardImpl value, $Res Function(_$BeerculesCardImpl) then) =
      __$$BeerculesCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerculesCardType key,
      int amount,
      bool isBasicRule,
      bool isVictimGlass});
}

/// @nodoc
class __$$BeerculesCardImplCopyWithImpl<$Res>
    extends _$BeerculesCardCopyWithImpl<$Res, _$BeerculesCardImpl>
    implements _$$BeerculesCardImplCopyWith<$Res> {
  __$$BeerculesCardImplCopyWithImpl(
      _$BeerculesCardImpl _value, $Res Function(_$BeerculesCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? amount = null,
    Object? isBasicRule = null,
    Object? isVictimGlass = null,
  }) {
    return _then(_$BeerculesCardImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      isBasicRule: null == isBasicRule
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: null == isVictimGlass
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BeerculesCardImpl
    with DiagnosticableTreeMixin
    implements _BeerculesCard {
  _$BeerculesCardImpl(
      {required this.key,
      required this.amount,
      required this.isBasicRule,
      required this.isVictimGlass});

  @override
  final BeerculesCardType key;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeerculesCardImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isBasicRule, isBasicRule) ||
                other.isBasicRule == isBasicRule) &&
            (identical(other.isVictimGlass, isVictimGlass) ||
                other.isVictimGlass == isVictimGlass));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, key, amount, isBasicRule, isVictimGlass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeerculesCardImplCopyWith<_$BeerculesCardImpl> get copyWith =>
      __$$BeerculesCardImplCopyWithImpl<_$BeerculesCardImpl>(this, _$identity);
}

abstract class _BeerculesCard implements BeerculesCard {
  factory _BeerculesCard(
      {required final BeerculesCardType key,
      required final int amount,
      required final bool isBasicRule,
      required final bool isVictimGlass}) = _$BeerculesCardImpl;

  @override
  BeerculesCardType get key;
  @override
  int get amount;
  @override
  bool get isBasicRule;
  @override
  bool get isVictimGlass;
  @override
  @JsonKey(ignore: true)
  _$$BeerculesCardImplCopyWith<_$BeerculesCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeerculesPlayCard {
  String get id => throw _privateConstructorUsedError;
  BeerculesCardType get key => throw _privateConstructorUsedError;
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
      _$BeerculesPlayCardCopyWithImpl<$Res, BeerculesPlayCard>;
  @useResult
  $Res call(
      {String id,
      BeerculesCardType key,
      bool played,
      bool isBasicRule,
      bool isVictimGlass});
}

/// @nodoc
class _$BeerculesPlayCardCopyWithImpl<$Res, $Val extends BeerculesPlayCard>
    implements $BeerculesPlayCardCopyWith<$Res> {
  _$BeerculesPlayCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? played = null,
    Object? isBasicRule = null,
    Object? isVictimGlass = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
      isBasicRule: null == isBasicRule
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: null == isVictimGlass
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeerculesPlayCardImplCopyWith<$Res>
    implements $BeerculesPlayCardCopyWith<$Res> {
  factory _$$BeerculesPlayCardImplCopyWith(_$BeerculesPlayCardImpl value,
          $Res Function(_$BeerculesPlayCardImpl) then) =
      __$$BeerculesPlayCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      BeerculesCardType key,
      bool played,
      bool isBasicRule,
      bool isVictimGlass});
}

/// @nodoc
class __$$BeerculesPlayCardImplCopyWithImpl<$Res>
    extends _$BeerculesPlayCardCopyWithImpl<$Res, _$BeerculesPlayCardImpl>
    implements _$$BeerculesPlayCardImplCopyWith<$Res> {
  __$$BeerculesPlayCardImplCopyWithImpl(_$BeerculesPlayCardImpl _value,
      $Res Function(_$BeerculesPlayCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? played = null,
    Object? isBasicRule = null,
    Object? isVictimGlass = null,
  }) {
    return _then(_$BeerculesPlayCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
      isBasicRule: null == isBasicRule
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: null == isVictimGlass
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BeerculesPlayCardImpl
    with DiagnosticableTreeMixin
    implements _BeerculesPlayCard {
  _$BeerculesPlayCardImpl(
      {required this.id,
      required this.key,
      required this.played,
      required this.isBasicRule,
      required this.isVictimGlass});

  @override
  final String id;
  @override
  final BeerculesCardType key;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeerculesPlayCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.played, played) || other.played == played) &&
            (identical(other.isBasicRule, isBasicRule) ||
                other.isBasicRule == isBasicRule) &&
            (identical(other.isVictimGlass, isVictimGlass) ||
                other.isVictimGlass == isVictimGlass));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, key, played, isBasicRule, isVictimGlass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeerculesPlayCardImplCopyWith<_$BeerculesPlayCardImpl> get copyWith =>
      __$$BeerculesPlayCardImplCopyWithImpl<_$BeerculesPlayCardImpl>(
          this, _$identity);
}

abstract class _BeerculesPlayCard implements BeerculesPlayCard {
  factory _BeerculesPlayCard(
      {required final String id,
      required final BeerculesCardType key,
      required final bool played,
      required final bool isBasicRule,
      required final bool isVictimGlass}) = _$BeerculesPlayCardImpl;

  @override
  String get id;
  @override
  BeerculesCardType get key;
  @override
  bool get played;
  @override
  bool get isBasicRule;
  @override
  bool get isVictimGlass;
  @override
  @JsonKey(ignore: true)
  _$$BeerculesPlayCardImplCopyWith<_$BeerculesPlayCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      _$BeerculesCardProviderModelCopyWithImpl<$Res,
          BeerculesCardProviderModel>;
  @useResult
  $Res call(
      {List<BeerculesPlayCard> currentGameCards,
      List<BeerculesCard> configCards});
}

/// @nodoc
class _$BeerculesCardProviderModelCopyWithImpl<$Res,
        $Val extends BeerculesCardProviderModel>
    implements $BeerculesCardProviderModelCopyWith<$Res> {
  _$BeerculesCardProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentGameCards = null,
    Object? configCards = null,
  }) {
    return _then(_value.copyWith(
      currentGameCards: null == currentGameCards
          ? _value.currentGameCards
          : currentGameCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesPlayCard>,
      configCards: null == configCards
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeerculesCardProviderModelImplCopyWith<$Res>
    implements $BeerculesCardProviderModelCopyWith<$Res> {
  factory _$$BeerculesCardProviderModelImplCopyWith(
          _$BeerculesCardProviderModelImpl value,
          $Res Function(_$BeerculesCardProviderModelImpl) then) =
      __$$BeerculesCardProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BeerculesPlayCard> currentGameCards,
      List<BeerculesCard> configCards});
}

/// @nodoc
class __$$BeerculesCardProviderModelImplCopyWithImpl<$Res>
    extends _$BeerculesCardProviderModelCopyWithImpl<$Res,
        _$BeerculesCardProviderModelImpl>
    implements _$$BeerculesCardProviderModelImplCopyWith<$Res> {
  __$$BeerculesCardProviderModelImplCopyWithImpl(
      _$BeerculesCardProviderModelImpl _value,
      $Res Function(_$BeerculesCardProviderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentGameCards = null,
    Object? configCards = null,
  }) {
    return _then(_$BeerculesCardProviderModelImpl(
      currentGameCards: null == currentGameCards
          ? _value._currentGameCards
          : currentGameCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesPlayCard>,
      configCards: null == configCards
          ? _value._configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ));
  }
}

/// @nodoc

class _$BeerculesCardProviderModelImpl
    with DiagnosticableTreeMixin
    implements _BeerculesCardProviderModel {
  _$BeerculesCardProviderModelImpl(
      {required final List<BeerculesPlayCard> currentGameCards,
      required final List<BeerculesCard> configCards})
      : _currentGameCards = currentGameCards,
        _configCards = configCards;

  final List<BeerculesPlayCard> _currentGameCards;
  @override
  List<BeerculesPlayCard> get currentGameCards {
    if (_currentGameCards is EqualUnmodifiableListView)
      return _currentGameCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentGameCards);
  }

  final List<BeerculesCard> _configCards;
  @override
  List<BeerculesCard> get configCards {
    if (_configCards is EqualUnmodifiableListView) return _configCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configCards);
  }

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeerculesCardProviderModelImpl &&
            const DeepCollectionEquality()
                .equals(other._currentGameCards, _currentGameCards) &&
            const DeepCollectionEquality()
                .equals(other._configCards, _configCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_currentGameCards),
      const DeepCollectionEquality().hash(_configCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeerculesCardProviderModelImplCopyWith<_$BeerculesCardProviderModelImpl>
      get copyWith => __$$BeerculesCardProviderModelImplCopyWithImpl<
          _$BeerculesCardProviderModelImpl>(this, _$identity);
}

abstract class _BeerculesCardProviderModel
    implements BeerculesCardProviderModel {
  factory _BeerculesCardProviderModel(
          {required final List<BeerculesPlayCard> currentGameCards,
          required final List<BeerculesCard> configCards}) =
      _$BeerculesCardProviderModelImpl;

  @override
  List<BeerculesPlayCard> get currentGameCards;
  @override
  List<BeerculesCard> get configCards;
  @override
  @JsonKey(ignore: true)
  _$$BeerculesCardProviderModelImplCopyWith<_$BeerculesCardProviderModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
