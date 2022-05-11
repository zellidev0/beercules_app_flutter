// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameModelTearOff {
  const _$GameModelTearOff();

  _GameModel call(
      {required List<BeerculesCard> cards,
      required double cardTransformSeed,
      required bool showContinueDialog,
      required bool showConfigIsDefaultMessage}) {
    return _GameModel(
      cards: cards,
      cardTransformSeed: cardTransformSeed,
      showContinueDialog: showContinueDialog,
      showConfigIsDefaultMessage: showConfigIsDefaultMessage,
    );
  }
}

/// @nodoc
const $GameModel = _$GameModelTearOff();

/// @nodoc
mixin _$GameModel {
  List<BeerculesCard> get cards => throw _privateConstructorUsedError;
  double get cardTransformSeed => throw _privateConstructorUsedError;
  bool get showContinueDialog => throw _privateConstructorUsedError;
  bool get showConfigIsDefaultMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res>;
  $Res call(
      {List<BeerculesCard> cards,
      double cardTransformSeed,
      bool showContinueDialog,
      bool showConfigIsDefaultMessage});
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res> implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  final GameModel _value;
  // ignore: unused_field
  final $Res Function(GameModel) _then;

  @override
  $Res call({
    Object? cards = freezed,
    Object? cardTransformSeed = freezed,
    Object? showContinueDialog = freezed,
    Object? showConfigIsDefaultMessage = freezed,
  }) {
    return _then(_value.copyWith(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
      cardTransformSeed: cardTransformSeed == freezed
          ? _value.cardTransformSeed
          : cardTransformSeed // ignore: cast_nullable_to_non_nullable
              as double,
      showContinueDialog: showContinueDialog == freezed
          ? _value.showContinueDialog
          : showContinueDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfigIsDefaultMessage: showConfigIsDefaultMessage == freezed
          ? _value.showConfigIsDefaultMessage
          : showConfigIsDefaultMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GameModelCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$GameModelCopyWith(
          _GameModel value, $Res Function(_GameModel) then) =
      __$GameModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BeerculesCard> cards,
      double cardTransformSeed,
      bool showContinueDialog,
      bool showConfigIsDefaultMessage});
}

/// @nodoc
class __$GameModelCopyWithImpl<$Res> extends _$GameModelCopyWithImpl<$Res>
    implements _$GameModelCopyWith<$Res> {
  __$GameModelCopyWithImpl(_GameModel _value, $Res Function(_GameModel) _then)
      : super(_value, (v) => _then(v as _GameModel));

  @override
  _GameModel get _value => super._value as _GameModel;

  @override
  $Res call({
    Object? cards = freezed,
    Object? cardTransformSeed = freezed,
    Object? showContinueDialog = freezed,
    Object? showConfigIsDefaultMessage = freezed,
  }) {
    return _then(_GameModel(
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
      cardTransformSeed: cardTransformSeed == freezed
          ? _value.cardTransformSeed
          : cardTransformSeed // ignore: cast_nullable_to_non_nullable
              as double,
      showContinueDialog: showContinueDialog == freezed
          ? _value.showContinueDialog
          : showContinueDialog // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfigIsDefaultMessage: showConfigIsDefaultMessage == freezed
          ? _value.showConfigIsDefaultMessage
          : showConfigIsDefaultMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GameModel implements _GameModel {
  _$_GameModel(
      {required this.cards,
      required this.cardTransformSeed,
      required this.showContinueDialog,
      required this.showConfigIsDefaultMessage});

  @override
  final List<BeerculesCard> cards;
  @override
  final double cardTransformSeed;
  @override
  final bool showContinueDialog;
  @override
  final bool showConfigIsDefaultMessage;

  @override
  String toString() {
    return 'GameModel(cards: $cards, cardTransformSeed: $cardTransformSeed, showContinueDialog: $showContinueDialog, showConfigIsDefaultMessage: $showConfigIsDefaultMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameModel &&
            const DeepCollectionEquality().equals(other.cards, cards) &&
            const DeepCollectionEquality()
                .equals(other.cardTransformSeed, cardTransformSeed) &&
            const DeepCollectionEquality()
                .equals(other.showContinueDialog, showContinueDialog) &&
            const DeepCollectionEquality().equals(
                other.showConfigIsDefaultMessage, showConfigIsDefaultMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cards),
      const DeepCollectionEquality().hash(cardTransformSeed),
      const DeepCollectionEquality().hash(showContinueDialog),
      const DeepCollectionEquality().hash(showConfigIsDefaultMessage));

  @JsonKey(ignore: true)
  @override
  _$GameModelCopyWith<_GameModel> get copyWith =>
      __$GameModelCopyWithImpl<_GameModel>(this, _$identity);
}

abstract class _GameModel implements GameModel {
  factory _GameModel(
      {required List<BeerculesCard> cards,
      required double cardTransformSeed,
      required bool showContinueDialog,
      required bool showConfigIsDefaultMessage}) = _$_GameModel;

  @override
  List<BeerculesCard> get cards;
  @override
  double get cardTransformSeed;
  @override
  bool get showContinueDialog;
  @override
  bool get showConfigIsDefaultMessage;
  @override
  @JsonKey(ignore: true)
  _$GameModelCopyWith<_GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
