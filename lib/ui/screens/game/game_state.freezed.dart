// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  List<GameStateCard> get cards => throw _privateConstructorUsedError;
  int get amountOfCardsLeft => throw _privateConstructorUsedError;
  bool get shouldShowContinueDialog => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {List<GameStateCard> cards,
      int amountOfCardsLeft,
      bool shouldShowContinueDialog});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? amountOfCardsLeft = null,
    Object? shouldShowContinueDialog = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameStateCard>,
      amountOfCardsLeft: null == amountOfCardsLeft
          ? _value.amountOfCardsLeft
          : amountOfCardsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      shouldShowContinueDialog: null == shouldShowContinueDialog
          ? _value.shouldShowContinueDialog
          : shouldShowContinueDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GameStateCard> cards,
      int amountOfCardsLeft,
      bool shouldShowContinueDialog});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? amountOfCardsLeft = null,
    Object? shouldShowContinueDialog = null,
  }) {
    return _then(_$GameStateImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameStateCard>,
      amountOfCardsLeft: null == amountOfCardsLeft
          ? _value.amountOfCardsLeft
          : amountOfCardsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      shouldShowContinueDialog: null == shouldShowContinueDialog
          ? _value.shouldShowContinueDialog
          : shouldShowContinueDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  _$GameStateImpl(
      {required final List<GameStateCard> cards,
      required this.amountOfCardsLeft,
      required this.shouldShowContinueDialog})
      : _cards = cards;

  final List<GameStateCard> _cards;
  @override
  List<GameStateCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int amountOfCardsLeft;
  @override
  final bool shouldShowContinueDialog;

  @override
  String toString() {
    return 'GameState(cards: $cards, amountOfCardsLeft: $amountOfCardsLeft, shouldShowContinueDialog: $shouldShowContinueDialog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.amountOfCardsLeft, amountOfCardsLeft) ||
                other.amountOfCardsLeft == amountOfCardsLeft) &&
            (identical(
                    other.shouldShowContinueDialog, shouldShowContinueDialog) ||
                other.shouldShowContinueDialog == shouldShowContinueDialog));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cards),
      amountOfCardsLeft,
      shouldShowContinueDialog);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  factory _GameState(
      {required final List<GameStateCard> cards,
      required final int amountOfCardsLeft,
      required final bool shouldShowContinueDialog}) = _$GameStateImpl;

  @override
  List<GameStateCard> get cards;
  @override
  int get amountOfCardsLeft;
  @override
  bool get shouldShowContinueDialog;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameStateCard {
  String get id => throw _privateConstructorUsedError;
  int get transformationAngle => throw _privateConstructorUsedError;
  BeerculesCardType get type => throw _privateConstructorUsedError;
  bool get wasPlayed => throw _privateConstructorUsedError;

  /// Create a copy of GameStateCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCardCopyWith<GameStateCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCardCopyWith<$Res> {
  factory $GameStateCardCopyWith(
          GameStateCard value, $Res Function(GameStateCard) then) =
      _$GameStateCardCopyWithImpl<$Res, GameStateCard>;
  @useResult
  $Res call(
      {String id,
      int transformationAngle,
      BeerculesCardType type,
      bool wasPlayed});
}

/// @nodoc
class _$GameStateCardCopyWithImpl<$Res, $Val extends GameStateCard>
    implements $GameStateCardCopyWith<$Res> {
  _$GameStateCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameStateCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transformationAngle = null,
    Object? type = null,
    Object? wasPlayed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transformationAngle: null == transformationAngle
          ? _value.transformationAngle
          : transformationAngle // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$GameStateCardImplCopyWith<$Res>
    implements $GameStateCardCopyWith<$Res> {
  factory _$$GameStateCardImplCopyWith(
          _$GameStateCardImpl value, $Res Function(_$GameStateCardImpl) then) =
      __$$GameStateCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int transformationAngle,
      BeerculesCardType type,
      bool wasPlayed});
}

/// @nodoc
class __$$GameStateCardImplCopyWithImpl<$Res>
    extends _$GameStateCardCopyWithImpl<$Res, _$GameStateCardImpl>
    implements _$$GameStateCardImplCopyWith<$Res> {
  __$$GameStateCardImplCopyWithImpl(
      _$GameStateCardImpl _value, $Res Function(_$GameStateCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameStateCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transformationAngle = null,
    Object? type = null,
    Object? wasPlayed = null,
  }) {
    return _then(_$GameStateCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transformationAngle: null == transformationAngle
          ? _value.transformationAngle
          : transformationAngle // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$GameStateCardImpl implements _GameStateCard {
  _$GameStateCardImpl(
      {required this.id,
      required this.transformationAngle,
      required this.type,
      required this.wasPlayed});

  @override
  final String id;
  @override
  final int transformationAngle;
  @override
  final BeerculesCardType type;
  @override
  final bool wasPlayed;

  @override
  String toString() {
    return 'GameStateCard(id: $id, transformationAngle: $transformationAngle, type: $type, wasPlayed: $wasPlayed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transformationAngle, transformationAngle) ||
                other.transformationAngle == transformationAngle) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wasPlayed, wasPlayed) ||
                other.wasPlayed == wasPlayed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, transformationAngle, type, wasPlayed);

  /// Create a copy of GameStateCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateCardImplCopyWith<_$GameStateCardImpl> get copyWith =>
      __$$GameStateCardImplCopyWithImpl<_$GameStateCardImpl>(this, _$identity);
}

abstract class _GameStateCard implements GameStateCard {
  factory _GameStateCard(
      {required final String id,
      required final int transformationAngle,
      required final BeerculesCardType type,
      required final bool wasPlayed}) = _$GameStateCardImpl;

  @override
  String get id;
  @override
  int get transformationAngle;
  @override
  BeerculesCardType get type;
  @override
  bool get wasPlayed;

  /// Create a copy of GameStateCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateCardImplCopyWith<_$GameStateCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
