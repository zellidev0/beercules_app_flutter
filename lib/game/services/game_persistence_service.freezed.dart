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
mixin _$GamePersistenceServiceCard {
  BeerculesCardType get type => throw _privateConstructorUsedError;
  bool get wasPlayed => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GamePersistenceServiceCardCopyWith<GamePersistenceServiceCard>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamePersistenceServiceCardCopyWith<$Res> {
  factory $GamePersistenceServiceCardCopyWith(GamePersistenceServiceCard value,
          $Res Function(GamePersistenceServiceCard) then) =
      _$GamePersistenceServiceCardCopyWithImpl<$Res,
          GamePersistenceServiceCard>;
  @useResult
  $Res call({BeerculesCardType type, bool wasPlayed, String id});
}

/// @nodoc
class _$GamePersistenceServiceCardCopyWithImpl<$Res,
        $Val extends GamePersistenceServiceCard>
    implements $GamePersistenceServiceCardCopyWith<$Res> {
  _$GamePersistenceServiceCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? wasPlayed = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      wasPlayed: null == wasPlayed
          ? _value.wasPlayed
          : wasPlayed // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GamePersistenceServiceCardImplCopyWith<$Res>
    implements $GamePersistenceServiceCardCopyWith<$Res> {
  factory _$$GamePersistenceServiceCardImplCopyWith(
          _$GamePersistenceServiceCardImpl value,
          $Res Function(_$GamePersistenceServiceCardImpl) then) =
      __$$GamePersistenceServiceCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerculesCardType type, bool wasPlayed, String id});
}

/// @nodoc
class __$$GamePersistenceServiceCardImplCopyWithImpl<$Res>
    extends _$GamePersistenceServiceCardCopyWithImpl<$Res,
        _$GamePersistenceServiceCardImpl>
    implements _$$GamePersistenceServiceCardImplCopyWith<$Res> {
  __$$GamePersistenceServiceCardImplCopyWithImpl(
      _$GamePersistenceServiceCardImpl _value,
      $Res Function(_$GamePersistenceServiceCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? wasPlayed = null,
    Object? id = null,
  }) {
    return _then(_$GamePersistenceServiceCardImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      wasPlayed: null == wasPlayed
          ? _value.wasPlayed
          : wasPlayed // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GamePersistenceServiceCardImpl implements _GamePersistenceServiceCard {
  _$GamePersistenceServiceCardImpl(
      {required this.type, required this.wasPlayed, required this.id});

  @override
  final BeerculesCardType type;
  @override
  final bool wasPlayed;
  @override
  final String id;

  @override
  String toString() {
    return 'GamePersistenceServiceCard(type: $type, wasPlayed: $wasPlayed, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamePersistenceServiceCardImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wasPlayed, wasPlayed) ||
                other.wasPlayed == wasPlayed) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, wasPlayed, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GamePersistenceServiceCardImplCopyWith<_$GamePersistenceServiceCardImpl>
      get copyWith => __$$GamePersistenceServiceCardImplCopyWithImpl<
          _$GamePersistenceServiceCardImpl>(this, _$identity);
}

abstract class _GamePersistenceServiceCard
    implements GamePersistenceServiceCard {
  factory _GamePersistenceServiceCard(
      {required final BeerculesCardType type,
      required final bool wasPlayed,
      required final String id}) = _$GamePersistenceServiceCardImpl;

  @override
  BeerculesCardType get type;
  @override
  bool get wasPlayed;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$GamePersistenceServiceCardImplCopyWith<_$GamePersistenceServiceCardImpl>
      get copyWith => throw _privateConstructorUsedError;
}
