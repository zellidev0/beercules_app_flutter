// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persistence_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersistenceServiceModelConfigCard {
  int get amount => throw _privateConstructorUsedError;
  BeerculesCardType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersistenceServiceModelConfigCardCopyWith<PersistenceServiceModelConfigCard>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistenceServiceModelConfigCardCopyWith<$Res> {
  factory $PersistenceServiceModelConfigCardCopyWith(
          PersistenceServiceModelConfigCard value,
          $Res Function(PersistenceServiceModelConfigCard) then) =
      _$PersistenceServiceModelConfigCardCopyWithImpl<$Res,
          PersistenceServiceModelConfigCard>;
  @useResult
  $Res call({int amount, BeerculesCardType type});
}

/// @nodoc
class _$PersistenceServiceModelConfigCardCopyWithImpl<$Res,
        $Val extends PersistenceServiceModelConfigCard>
    implements $PersistenceServiceModelConfigCardCopyWith<$Res> {
  _$PersistenceServiceModelConfigCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistenceServiceModelConfigCardImplCopyWith<$Res>
    implements $PersistenceServiceModelConfigCardCopyWith<$Res> {
  factory _$$PersistenceServiceModelConfigCardImplCopyWith(
          _$PersistenceServiceModelConfigCardImpl value,
          $Res Function(_$PersistenceServiceModelConfigCardImpl) then) =
      __$$PersistenceServiceModelConfigCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, BeerculesCardType type});
}

/// @nodoc
class __$$PersistenceServiceModelConfigCardImplCopyWithImpl<$Res>
    extends _$PersistenceServiceModelConfigCardCopyWithImpl<$Res,
        _$PersistenceServiceModelConfigCardImpl>
    implements _$$PersistenceServiceModelConfigCardImplCopyWith<$Res> {
  __$$PersistenceServiceModelConfigCardImplCopyWithImpl(
      _$PersistenceServiceModelConfigCardImpl _value,
      $Res Function(_$PersistenceServiceModelConfigCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? type = null,
  }) {
    return _then(_$PersistenceServiceModelConfigCardImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
    ));
  }
}

/// @nodoc

class _$PersistenceServiceModelConfigCardImpl
    implements _PersistenceServiceModelConfigCard {
  _$PersistenceServiceModelConfigCardImpl(
      {required this.amount, required this.type});

  @override
  final int amount;
  @override
  final BeerculesCardType type;

  @override
  String toString() {
    return 'PersistenceServiceModelConfigCard(amount: $amount, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistenceServiceModelConfigCardImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersistenceServiceModelConfigCardImplCopyWith<
          _$PersistenceServiceModelConfigCardImpl>
      get copyWith => __$$PersistenceServiceModelConfigCardImplCopyWithImpl<
          _$PersistenceServiceModelConfigCardImpl>(this, _$identity);
}

abstract class _PersistenceServiceModelConfigCard
    implements PersistenceServiceModelConfigCard {
  factory _PersistenceServiceModelConfigCard(
          {required final int amount, required final BeerculesCardType type}) =
      _$PersistenceServiceModelConfigCardImpl;

  @override
  int get amount;
  @override
  BeerculesCardType get type;
  @override
  @JsonKey(ignore: true)
  _$$PersistenceServiceModelConfigCardImplCopyWith<
          _$PersistenceServiceModelConfigCardImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PersistenceServiceModel {
  List<PersistenceServiceModelActiveGameCard> get currentGameCards =>
      throw _privateConstructorUsedError;
  List<PersistenceServiceModelConfigCard> get configCards =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersistenceServiceModelCopyWith<PersistenceServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistenceServiceModelCopyWith<$Res> {
  factory $PersistenceServiceModelCopyWith(PersistenceServiceModel value,
          $Res Function(PersistenceServiceModel) then) =
      _$PersistenceServiceModelCopyWithImpl<$Res, PersistenceServiceModel>;
  @useResult
  $Res call(
      {List<PersistenceServiceModelActiveGameCard> currentGameCards,
      List<PersistenceServiceModelConfigCard> configCards});
}

/// @nodoc
class _$PersistenceServiceModelCopyWithImpl<$Res,
        $Val extends PersistenceServiceModel>
    implements $PersistenceServiceModelCopyWith<$Res> {
  _$PersistenceServiceModelCopyWithImpl(this._value, this._then);

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
              as List<PersistenceServiceModelActiveGameCard>,
      configCards: null == configCards
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<PersistenceServiceModelConfigCard>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistenceServiceModelImplCopyWith<$Res>
    implements $PersistenceServiceModelCopyWith<$Res> {
  factory _$$PersistenceServiceModelImplCopyWith(
          _$PersistenceServiceModelImpl value,
          $Res Function(_$PersistenceServiceModelImpl) then) =
      __$$PersistenceServiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PersistenceServiceModelActiveGameCard> currentGameCards,
      List<PersistenceServiceModelConfigCard> configCards});
}

/// @nodoc
class __$$PersistenceServiceModelImplCopyWithImpl<$Res>
    extends _$PersistenceServiceModelCopyWithImpl<$Res,
        _$PersistenceServiceModelImpl>
    implements _$$PersistenceServiceModelImplCopyWith<$Res> {
  __$$PersistenceServiceModelImplCopyWithImpl(
      _$PersistenceServiceModelImpl _value,
      $Res Function(_$PersistenceServiceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentGameCards = null,
    Object? configCards = null,
  }) {
    return _then(_$PersistenceServiceModelImpl(
      currentGameCards: null == currentGameCards
          ? _value._currentGameCards
          : currentGameCards // ignore: cast_nullable_to_non_nullable
              as List<PersistenceServiceModelActiveGameCard>,
      configCards: null == configCards
          ? _value._configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<PersistenceServiceModelConfigCard>,
    ));
  }
}

/// @nodoc

class _$PersistenceServiceModelImpl implements _PersistenceServiceModel {
  _$PersistenceServiceModelImpl(
      {required final List<PersistenceServiceModelActiveGameCard>
          currentGameCards,
      required final List<PersistenceServiceModelConfigCard> configCards})
      : _currentGameCards = currentGameCards,
        _configCards = configCards;

  final List<PersistenceServiceModelActiveGameCard> _currentGameCards;
  @override
  List<PersistenceServiceModelActiveGameCard> get currentGameCards {
    if (_currentGameCards is EqualUnmodifiableListView)
      return _currentGameCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentGameCards);
  }

  final List<PersistenceServiceModelConfigCard> _configCards;
  @override
  List<PersistenceServiceModelConfigCard> get configCards {
    if (_configCards is EqualUnmodifiableListView) return _configCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configCards);
  }

  @override
  String toString() {
    return 'PersistenceServiceModel(currentGameCards: $currentGameCards, configCards: $configCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistenceServiceModelImpl &&
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
  _$$PersistenceServiceModelImplCopyWith<_$PersistenceServiceModelImpl>
      get copyWith => __$$PersistenceServiceModelImplCopyWithImpl<
          _$PersistenceServiceModelImpl>(this, _$identity);
}

abstract class _PersistenceServiceModel implements PersistenceServiceModel {
  factory _PersistenceServiceModel(
          {required final List<PersistenceServiceModelActiveGameCard>
              currentGameCards,
          required final List<PersistenceServiceModelConfigCard> configCards}) =
      _$PersistenceServiceModelImpl;

  @override
  List<PersistenceServiceModelActiveGameCard> get currentGameCards;
  @override
  List<PersistenceServiceModelConfigCard> get configCards;
  @override
  @JsonKey(ignore: true)
  _$$PersistenceServiceModelImplCopyWith<_$PersistenceServiceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PersistenceServiceModelActiveGameCard {
  String get id => throw _privateConstructorUsedError;
  BeerculesCardType get type => throw _privateConstructorUsedError;
  bool get wasPlayed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersistenceServiceModelActiveGameCardCopyWith<
          PersistenceServiceModelActiveGameCard>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersistenceServiceModelActiveGameCardCopyWith<$Res> {
  factory $PersistenceServiceModelActiveGameCardCopyWith(
          PersistenceServiceModelActiveGameCard value,
          $Res Function(PersistenceServiceModelActiveGameCard) then) =
      _$PersistenceServiceModelActiveGameCardCopyWithImpl<$Res,
          PersistenceServiceModelActiveGameCard>;
  @useResult
  $Res call({String id, BeerculesCardType type, bool wasPlayed});
}

/// @nodoc
class _$PersistenceServiceModelActiveGameCardCopyWithImpl<$Res,
        $Val extends PersistenceServiceModelActiveGameCard>
    implements $PersistenceServiceModelActiveGameCardCopyWith<$Res> {
  _$PersistenceServiceModelActiveGameCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? wasPlayed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      wasPlayed: null == wasPlayed
          ? _value.wasPlayed
          : wasPlayed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersistenceServiceModelActiveGameCardImplCopyWith<$Res>
    implements $PersistenceServiceModelActiveGameCardCopyWith<$Res> {
  factory _$$PersistenceServiceModelActiveGameCardImplCopyWith(
          _$PersistenceServiceModelActiveGameCardImpl value,
          $Res Function(_$PersistenceServiceModelActiveGameCardImpl) then) =
      __$$PersistenceServiceModelActiveGameCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, BeerculesCardType type, bool wasPlayed});
}

/// @nodoc
class __$$PersistenceServiceModelActiveGameCardImplCopyWithImpl<$Res>
    extends _$PersistenceServiceModelActiveGameCardCopyWithImpl<$Res,
        _$PersistenceServiceModelActiveGameCardImpl>
    implements _$$PersistenceServiceModelActiveGameCardImplCopyWith<$Res> {
  __$$PersistenceServiceModelActiveGameCardImplCopyWithImpl(
      _$PersistenceServiceModelActiveGameCardImpl _value,
      $Res Function(_$PersistenceServiceModelActiveGameCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? wasPlayed = null,
  }) {
    return _then(_$PersistenceServiceModelActiveGameCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      wasPlayed: null == wasPlayed
          ? _value.wasPlayed
          : wasPlayed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PersistenceServiceModelActiveGameCardImpl
    implements _PersistenceServiceModelActiveGameCard {
  _$PersistenceServiceModelActiveGameCardImpl(
      {required this.id, required this.type, required this.wasPlayed});

  @override
  final String id;
  @override
  final BeerculesCardType type;
  @override
  final bool wasPlayed;

  @override
  String toString() {
    return 'PersistenceServiceModelActiveGameCard(id: $id, type: $type, wasPlayed: $wasPlayed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersistenceServiceModelActiveGameCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wasPlayed, wasPlayed) ||
                other.wasPlayed == wasPlayed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, wasPlayed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersistenceServiceModelActiveGameCardImplCopyWith<
          _$PersistenceServiceModelActiveGameCardImpl>
      get copyWith => __$$PersistenceServiceModelActiveGameCardImplCopyWithImpl<
          _$PersistenceServiceModelActiveGameCardImpl>(this, _$identity);
}

abstract class _PersistenceServiceModelActiveGameCard
    implements PersistenceServiceModelActiveGameCard {
  factory _PersistenceServiceModelActiveGameCard(
          {required final String id,
          required final BeerculesCardType type,
          required final bool wasPlayed}) =
      _$PersistenceServiceModelActiveGameCardImpl;

  @override
  String get id;
  @override
  BeerculesCardType get type;
  @override
  bool get wasPlayed;
  @override
  @JsonKey(ignore: true)
  _$$PersistenceServiceModelActiveGameCardImplCopyWith<
          _$PersistenceServiceModelActiveGameCardImpl>
      get copyWith => throw _privateConstructorUsedError;
}
