// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DatabaseCard _$DatabaseCardFromJson(Map<String, dynamic> json) {
  return _DatabaseCard.fromJson(json);
}

/// @nodoc
mixin _$DatabaseCard {
  BeerculesCardType get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatabaseCardCopyWith<DatabaseCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseCardCopyWith<$Res> {
  factory $DatabaseCardCopyWith(
          DatabaseCard value, $Res Function(DatabaseCard) then) =
      _$DatabaseCardCopyWithImpl<$Res, DatabaseCard>;
  @useResult
  $Res call({BeerculesCardType type, int amount});
}

/// @nodoc
class _$DatabaseCardCopyWithImpl<$Res, $Val extends DatabaseCard>
    implements $DatabaseCardCopyWith<$Res> {
  _$DatabaseCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseCardImplCopyWith<$Res>
    implements $DatabaseCardCopyWith<$Res> {
  factory _$$DatabaseCardImplCopyWith(
          _$DatabaseCardImpl value, $Res Function(_$DatabaseCardImpl) then) =
      __$$DatabaseCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerculesCardType type, int amount});
}

/// @nodoc
class __$$DatabaseCardImplCopyWithImpl<$Res>
    extends _$DatabaseCardCopyWithImpl<$Res, _$DatabaseCardImpl>
    implements _$$DatabaseCardImplCopyWith<$Res> {
  __$$DatabaseCardImplCopyWithImpl(
      _$DatabaseCardImpl _value, $Res Function(_$DatabaseCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$DatabaseCardImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatabaseCardImpl implements _DatabaseCard {
  _$DatabaseCardImpl({required this.type, required this.amount});

  factory _$DatabaseCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatabaseCardImplFromJson(json);

  @override
  final BeerculesCardType type;
  @override
  final int amount;

  @override
  String toString() {
    return 'DatabaseCard(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseCardImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseCardImplCopyWith<_$DatabaseCardImpl> get copyWith =>
      __$$DatabaseCardImplCopyWithImpl<_$DatabaseCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatabaseCardImplToJson(
      this,
    );
  }
}

abstract class _DatabaseCard implements DatabaseCard {
  factory _DatabaseCard(
      {required final BeerculesCardType type,
      required final int amount}) = _$DatabaseCardImpl;

  factory _DatabaseCard.fromJson(Map<String, dynamic> json) =
      _$DatabaseCardImpl.fromJson;

  @override
  BeerculesCardType get type;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$DatabaseCardImplCopyWith<_$DatabaseCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
