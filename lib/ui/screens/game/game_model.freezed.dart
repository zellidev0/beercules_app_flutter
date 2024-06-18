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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameModel {
  List<GameModelCard> get notYetPlayedCards =>
      throw _privateConstructorUsedError;
  List<GameModelCard> get playedCards => throw _privateConstructorUsedError;
  int get amountOfCardsLeft => throw _privateConstructorUsedError;
  BannerAd? get bannerAd => throw _privateConstructorUsedError;

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
      {List<GameModelCard> notYetPlayedCards,
      List<GameModelCard> playedCards,
      int amountOfCardsLeft,
      BannerAd? bannerAd});
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
    Object? notYetPlayedCards = null,
    Object? playedCards = null,
    Object? amountOfCardsLeft = null,
    Object? bannerAd = freezed,
  }) {
    return _then(_value.copyWith(
      notYetPlayedCards: null == notYetPlayedCards
          ? _value.notYetPlayedCards
          : notYetPlayedCards // ignore: cast_nullable_to_non_nullable
              as List<GameModelCard>,
      playedCards: null == playedCards
          ? _value.playedCards
          : playedCards // ignore: cast_nullable_to_non_nullable
              as List<GameModelCard>,
      amountOfCardsLeft: null == amountOfCardsLeft
          ? _value.amountOfCardsLeft
          : amountOfCardsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      bannerAd: freezed == bannerAd
          ? _value.bannerAd
          : bannerAd // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
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
      {List<GameModelCard> notYetPlayedCards,
      List<GameModelCard> playedCards,
      int amountOfCardsLeft,
      BannerAd? bannerAd});
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
    Object? notYetPlayedCards = null,
    Object? playedCards = null,
    Object? amountOfCardsLeft = null,
    Object? bannerAd = freezed,
  }) {
    return _then(_$GameModelImpl(
      notYetPlayedCards: null == notYetPlayedCards
          ? _value._notYetPlayedCards
          : notYetPlayedCards // ignore: cast_nullable_to_non_nullable
              as List<GameModelCard>,
      playedCards: null == playedCards
          ? _value._playedCards
          : playedCards // ignore: cast_nullable_to_non_nullable
              as List<GameModelCard>,
      amountOfCardsLeft: null == amountOfCardsLeft
          ? _value.amountOfCardsLeft
          : amountOfCardsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      bannerAd: freezed == bannerAd
          ? _value.bannerAd
          : bannerAd // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
    ));
  }
}

/// @nodoc

class _$GameModelImpl implements _GameModel {
  _$GameModelImpl(
      {required final List<GameModelCard> notYetPlayedCards,
      required final List<GameModelCard> playedCards,
      required this.amountOfCardsLeft,
      required this.bannerAd})
      : _notYetPlayedCards = notYetPlayedCards,
        _playedCards = playedCards;

  final List<GameModelCard> _notYetPlayedCards;
  @override
  List<GameModelCard> get notYetPlayedCards {
    if (_notYetPlayedCards is EqualUnmodifiableListView)
      return _notYetPlayedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notYetPlayedCards);
  }

  final List<GameModelCard> _playedCards;
  @override
  List<GameModelCard> get playedCards {
    if (_playedCards is EqualUnmodifiableListView) return _playedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playedCards);
  }

  @override
  final int amountOfCardsLeft;
  @override
  final BannerAd? bannerAd;

  @override
  String toString() {
    return 'GameModel(notYetPlayedCards: $notYetPlayedCards, playedCards: $playedCards, amountOfCardsLeft: $amountOfCardsLeft, bannerAd: $bannerAd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            const DeepCollectionEquality()
                .equals(other._notYetPlayedCards, _notYetPlayedCards) &&
            const DeepCollectionEquality()
                .equals(other._playedCards, _playedCards) &&
            (identical(other.amountOfCardsLeft, amountOfCardsLeft) ||
                other.amountOfCardsLeft == amountOfCardsLeft) &&
            (identical(other.bannerAd, bannerAd) ||
                other.bannerAd == bannerAd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notYetPlayedCards),
      const DeepCollectionEquality().hash(_playedCards),
      amountOfCardsLeft,
      bannerAd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);
}

abstract class _GameModel implements GameModel {
  factory _GameModel(
      {required final List<GameModelCard> notYetPlayedCards,
      required final List<GameModelCard> playedCards,
      required final int amountOfCardsLeft,
      required final BannerAd? bannerAd}) = _$GameModelImpl;

  @override
  List<GameModelCard> get notYetPlayedCards;
  @override
  List<GameModelCard> get playedCards;
  @override
  int get amountOfCardsLeft;
  @override
  BannerAd? get bannerAd;
  @override
  @JsonKey(ignore: true)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameModelCard {
  String get id => throw _privateConstructorUsedError;
  int get transformationAngle => throw _privateConstructorUsedError;
  BeerculesCardType get type => throw _privateConstructorUsedError;

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
  $Res call({String id, int transformationAngle, BeerculesCardType type});
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
    Object? transformationAngle = null,
    Object? type = null,
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
  $Res call({String id, int transformationAngle, BeerculesCardType type});
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
    Object? transformationAngle = null,
    Object? type = null,
  }) {
    return _then(_$GameModelCardImpl(
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
    ));
  }
}

/// @nodoc

class _$GameModelCardImpl implements _GameModelCard {
  _$GameModelCardImpl(
      {required this.id,
      required this.transformationAngle,
      required this.type});

  @override
  final String id;
  @override
  final int transformationAngle;
  @override
  final BeerculesCardType type;

  @override
  String toString() {
    return 'GameModelCard(id: $id, transformationAngle: $transformationAngle, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transformationAngle, transformationAngle) ||
                other.transformationAngle == transformationAngle) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, transformationAngle, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelCardImplCopyWith<_$GameModelCardImpl> get copyWith =>
      __$$GameModelCardImplCopyWithImpl<_$GameModelCardImpl>(this, _$identity);
}

abstract class _GameModelCard implements GameModelCard {
  factory _GameModelCard(
      {required final String id,
      required final int transformationAngle,
      required final BeerculesCardType type}) = _$GameModelCardImpl;

  @override
  String get id;
  @override
  int get transformationAngle;
  @override
  BeerculesCardType get type;
  @override
  @JsonKey(ignore: true)
  _$$GameModelCardImplCopyWith<_$GameModelCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
