// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameModel {
  List<GameModelCard> get cards => throw _privateConstructorUsedError;
  double get cardTransformSeed => throw _privateConstructorUsedError;
  bool get showContinueDialog => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call(
      {List<GameModelCard> cards,
      double cardTransformSeed,
      bool showContinueDialog});
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? cardTransformSeed = null,
    Object? showContinueDialog = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameModelCard>,
      cardTransformSeed: null == cardTransformSeed
          ? _value.cardTransformSeed
          : cardTransformSeed // ignore: cast_nullable_to_non_nullable
              as double,
      showContinueDialog: null == showContinueDialog
          ? _value.showContinueDialog
          : showContinueDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameModelImplCopyWith<$Res>
    implements $GameModelCopyWith<$Res> {
  factory _$$GameModelImplCopyWith(
          _$GameModelImpl value, $Res Function(_$GameModelImpl) then) =
      __$$GameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GameModelCard> cards,
      double cardTransformSeed,
      bool showContinueDialog});
}

/// @nodoc
class __$$GameModelImplCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$GameModelImpl>
    implements _$$GameModelImplCopyWith<$Res> {
  __$$GameModelImplCopyWithImpl(
      _$GameModelImpl _value, $Res Function(_$GameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? cardTransformSeed = null,
    Object? showContinueDialog = null,
  }) {
    return _then(_$GameModelImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GameModelCard>,
      cardTransformSeed: null == cardTransformSeed
          ? _value.cardTransformSeed
          : cardTransformSeed // ignore: cast_nullable_to_non_nullable
              as double,
      showContinueDialog: null == showContinueDialog
          ? _value.showContinueDialog
          : showContinueDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GameModelImpl implements _GameModel {
  _$GameModelImpl(
      {required final List<GameModelCard> cards,
      required this.cardTransformSeed,
      required this.showContinueDialog})
      : _cards = cards;

  final List<GameModelCard> _cards;
  @override
  List<GameModelCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final double cardTransformSeed;
  @override
  final bool showContinueDialog;

  @override
  String toString() {
    return 'GameModel(cards: $cards, cardTransformSeed: $cardTransformSeed, showContinueDialog: $showContinueDialog)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.cardTransformSeed, cardTransformSeed) ||
                other.cardTransformSeed == cardTransformSeed) &&
            (identical(other.showContinueDialog, showContinueDialog) ||
                other.showContinueDialog == showContinueDialog));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cards),
      cardTransformSeed,
      showContinueDialog);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);
}

abstract class _GameModel implements GameModel {
  factory _GameModel(
      {required final List<GameModelCard> cards,
      required final double cardTransformSeed,
      required final bool showContinueDialog}) = _$GameModelImpl;

  @override
  List<GameModelCard> get cards;
  @override
  double get cardTransformSeed;
  @override
  bool get showContinueDialog;
  @override
  @JsonKey(ignore: true)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameModelCard {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  bool get isBasicRule => throw _privateConstructorUsedError;
  bool get isVictimGlass => throw _privateConstructorUsedError;
  String get victimGlassKey => throw _privateConstructorUsedError;
  bool get played => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameModelCardCopyWith<GameModelCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCardCopyWith<$Res> {
  factory $GameModelCardCopyWith(
          GameModelCard value, $Res Function(GameModelCard) then) =
      _$GameModelCardCopyWithImpl<$Res, GameModelCard>;
  @useResult
  $Res call(
      {String id,
      String key,
      bool isBasicRule,
      bool isVictimGlass,
      String victimGlassKey,
      bool played});
}

/// @nodoc
class _$GameModelCardCopyWithImpl<$Res, $Val extends GameModelCard>
    implements $GameModelCardCopyWith<$Res> {
  _$GameModelCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? isBasicRule = null,
    Object? isVictimGlass = null,
    Object? victimGlassKey = null,
    Object? played = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      isBasicRule: null == isBasicRule
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: null == isVictimGlass
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
      victimGlassKey: null == victimGlassKey
          ? _value.victimGlassKey
          : victimGlassKey // ignore: cast_nullable_to_non_nullable
              as String,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameModelCardImplCopyWith<$Res>
    implements $GameModelCardCopyWith<$Res> {
  factory _$$GameModelCardImplCopyWith(
          _$GameModelCardImpl value, $Res Function(_$GameModelCardImpl) then) =
      __$$GameModelCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String key,
      bool isBasicRule,
      bool isVictimGlass,
      String victimGlassKey,
      bool played});
}

/// @nodoc
class __$$GameModelCardImplCopyWithImpl<$Res>
    extends _$GameModelCardCopyWithImpl<$Res, _$GameModelCardImpl>
    implements _$$GameModelCardImplCopyWith<$Res> {
  __$$GameModelCardImplCopyWithImpl(
      _$GameModelCardImpl _value, $Res Function(_$GameModelCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? isBasicRule = null,
    Object? isVictimGlass = null,
    Object? victimGlassKey = null,
    Object? played = null,
  }) {
    return _then(_$GameModelCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      isBasicRule: null == isBasicRule
          ? _value.isBasicRule
          : isBasicRule // ignore: cast_nullable_to_non_nullable
              as bool,
      isVictimGlass: null == isVictimGlass
          ? _value.isVictimGlass
          : isVictimGlass // ignore: cast_nullable_to_non_nullable
              as bool,
      victimGlassKey: null == victimGlassKey
          ? _value.victimGlassKey
          : victimGlassKey // ignore: cast_nullable_to_non_nullable
              as String,
      played: null == played
          ? _value.played
          : played // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GameModelCardImpl implements _GameModelCard {
  _$GameModelCardImpl(
      {required this.id,
      required this.key,
      required this.isBasicRule,
      required this.isVictimGlass,
      required this.victimGlassKey,
      required this.played});

  @override
  final String id;
  @override
  final String key;
  @override
  final bool isBasicRule;
  @override
  final bool isVictimGlass;
  @override
  final String victimGlassKey;
  @override
  final bool played;

  @override
  String toString() {
    return 'GameModelCard(id: $id, key: $key, isBasicRule: $isBasicRule, isVictimGlass: $isVictimGlass, victimGlassKey: $victimGlassKey, played: $played)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.isBasicRule, isBasicRule) ||
                other.isBasicRule == isBasicRule) &&
            (identical(other.isVictimGlass, isVictimGlass) ||
                other.isVictimGlass == isVictimGlass) &&
            (identical(other.victimGlassKey, victimGlassKey) ||
                other.victimGlassKey == victimGlassKey) &&
            (identical(other.played, played) || other.played == played));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, key, isBasicRule, isVictimGlass, victimGlassKey, played);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelCardImplCopyWith<_$GameModelCardImpl> get copyWith =>
      __$$GameModelCardImplCopyWithImpl<_$GameModelCardImpl>(this, _$identity);
}

abstract class _GameModelCard implements GameModelCard {
  factory _GameModelCard(
      {required final String id,
      required final String key,
      required final bool isBasicRule,
      required final bool isVictimGlass,
      required final String victimGlassKey,
      required final bool played}) = _$GameModelCardImpl;

  @override
  String get id;
  @override
  String get key;
  @override
  bool get isBasicRule;
  @override
  bool get isVictimGlass;
  @override
  String get victimGlassKey;
  @override
  bool get played;
  @override
  @JsonKey(ignore: true)
  _$$GameModelCardImplCopyWith<_$GameModelCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
