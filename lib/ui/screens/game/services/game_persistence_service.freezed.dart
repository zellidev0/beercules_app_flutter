// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_persistence_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GamePersistenceServiceGame {
  Map<BeerculesCardType, int> get cardToAmountMapping =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GamePersistenceServiceGameCopyWith<GamePersistenceServiceGame>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamePersistenceServiceGameCopyWith<$Res> {
  factory $GamePersistenceServiceGameCopyWith(GamePersistenceServiceGame value,
          $Res Function(GamePersistenceServiceGame) then) =
      _$GamePersistenceServiceGameCopyWithImpl<$Res,
          GamePersistenceServiceGame>;
  @useResult
  $Res call({Map<BeerculesCardType, int> cardToAmountMapping});
}

/// @nodoc
class _$GamePersistenceServiceGameCopyWithImpl<$Res,
        $Val extends GamePersistenceServiceGame>
    implements $GamePersistenceServiceGameCopyWith<$Res> {
  _$GamePersistenceServiceGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardToAmountMapping = null,
  }) {
    return _then(_value.copyWith(
      cardToAmountMapping: null == cardToAmountMapping
          ? _value.cardToAmountMapping
          : cardToAmountMapping // ignore: cast_nullable_to_non_nullable
              as Map<BeerculesCardType, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GamePersistenceServiceGameImplCopyWith<$Res>
    implements $GamePersistenceServiceGameCopyWith<$Res> {
  factory _$$GamePersistenceServiceGameImplCopyWith(
          _$GamePersistenceServiceGameImpl value,
          $Res Function(_$GamePersistenceServiceGameImpl) then) =
      __$$GamePersistenceServiceGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<BeerculesCardType, int> cardToAmountMapping});
}

/// @nodoc
class __$$GamePersistenceServiceGameImplCopyWithImpl<$Res>
    extends _$GamePersistenceServiceGameCopyWithImpl<$Res,
        _$GamePersistenceServiceGameImpl>
    implements _$$GamePersistenceServiceGameImplCopyWith<$Res> {
  __$$GamePersistenceServiceGameImplCopyWithImpl(
      _$GamePersistenceServiceGameImpl _value,
      $Res Function(_$GamePersistenceServiceGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardToAmountMapping = null,
  }) {
    return _then(_$GamePersistenceServiceGameImpl(
      cardToAmountMapping: null == cardToAmountMapping
          ? _value._cardToAmountMapping
          : cardToAmountMapping // ignore: cast_nullable_to_non_nullable
              as Map<BeerculesCardType, int>,
    ));
  }
}

/// @nodoc

class _$GamePersistenceServiceGameImpl implements _GamePersistenceServiceGame {
  _$GamePersistenceServiceGameImpl(
      {required final Map<BeerculesCardType, int> cardToAmountMapping})
      : _cardToAmountMapping = cardToAmountMapping;

  final Map<BeerculesCardType, int> _cardToAmountMapping;
  @override
  Map<BeerculesCardType, int> get cardToAmountMapping {
    if (_cardToAmountMapping is EqualUnmodifiableMapView)
      return _cardToAmountMapping;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cardToAmountMapping);
  }

  @override
  String toString() {
    return 'GamePersistenceServiceGame(cardToAmountMapping: $cardToAmountMapping)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamePersistenceServiceGameImpl &&
            const DeepCollectionEquality()
                .equals(other._cardToAmountMapping, _cardToAmountMapping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cardToAmountMapping));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GamePersistenceServiceGameImplCopyWith<_$GamePersistenceServiceGameImpl>
      get copyWith => __$$GamePersistenceServiceGameImplCopyWithImpl<
          _$GamePersistenceServiceGameImpl>(this, _$identity);
}

abstract class _GamePersistenceServiceGame
    implements GamePersistenceServiceGame {
  factory _GamePersistenceServiceGame(
          {required final Map<BeerculesCardType, int> cardToAmountMapping}) =
      _$GamePersistenceServiceGameImpl;

  @override
  Map<BeerculesCardType, int> get cardToAmountMapping;
  @override
  @JsonKey(ignore: true)
  _$$GamePersistenceServiceGameImplCopyWith<_$GamePersistenceServiceGameImpl>
      get copyWith => throw _privateConstructorUsedError;
}
