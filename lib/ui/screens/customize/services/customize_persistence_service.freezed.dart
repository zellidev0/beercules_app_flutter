// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customize_persistence_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomizePersistenceServiceModelCard {
  BeerculesCardType get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomizePersistenceServiceModelCardCopyWith<
          CustomizePersistenceServiceModelCard>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizePersistenceServiceModelCardCopyWith<$Res> {
  factory $CustomizePersistenceServiceModelCardCopyWith(
          CustomizePersistenceServiceModelCard value,
          $Res Function(CustomizePersistenceServiceModelCard) then) =
      _$CustomizePersistenceServiceModelCardCopyWithImpl<$Res,
          CustomizePersistenceServiceModelCard>;
  @useResult
  $Res call({BeerculesCardType type, int amount});
}

/// @nodoc
class _$CustomizePersistenceServiceModelCardCopyWithImpl<$Res,
        $Val extends CustomizePersistenceServiceModelCard>
    implements $CustomizePersistenceServiceModelCardCopyWith<$Res> {
  _$CustomizePersistenceServiceModelCardCopyWithImpl(this._value, this._then);

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
abstract class _$$CustomizePersistenceServiceModelCardImplCopyWith<$Res>
    implements $CustomizePersistenceServiceModelCardCopyWith<$Res> {
  factory _$$CustomizePersistenceServiceModelCardImplCopyWith(
          _$CustomizePersistenceServiceModelCardImpl value,
          $Res Function(_$CustomizePersistenceServiceModelCardImpl) then) =
      __$$CustomizePersistenceServiceModelCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerculesCardType type, int amount});
}

/// @nodoc
class __$$CustomizePersistenceServiceModelCardImplCopyWithImpl<$Res>
    extends _$CustomizePersistenceServiceModelCardCopyWithImpl<$Res,
        _$CustomizePersistenceServiceModelCardImpl>
    implements _$$CustomizePersistenceServiceModelCardImplCopyWith<$Res> {
  __$$CustomizePersistenceServiceModelCardImplCopyWithImpl(
      _$CustomizePersistenceServiceModelCardImpl _value,
      $Res Function(_$CustomizePersistenceServiceModelCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$CustomizePersistenceServiceModelCardImpl(
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

class _$CustomizePersistenceServiceModelCardImpl
    implements _CustomizePersistenceServiceModelCard {
  _$CustomizePersistenceServiceModelCardImpl(
      {required this.type, required this.amount});

  @override
  final BeerculesCardType type;
  @override
  final int amount;

  @override
  String toString() {
    return 'CustomizePersistenceServiceModelCard(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizePersistenceServiceModelCardImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizePersistenceServiceModelCardImplCopyWith<
          _$CustomizePersistenceServiceModelCardImpl>
      get copyWith => __$$CustomizePersistenceServiceModelCardImplCopyWithImpl<
          _$CustomizePersistenceServiceModelCardImpl>(this, _$identity);
}

abstract class _CustomizePersistenceServiceModelCard
    implements CustomizePersistenceServiceModelCard {
  factory _CustomizePersistenceServiceModelCard(
      {required final BeerculesCardType type,
      required final int amount}) = _$CustomizePersistenceServiceModelCardImpl;

  @override
  BeerculesCardType get type;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$CustomizePersistenceServiceModelCardImplCopyWith<
          _$CustomizePersistenceServiceModelCardImpl>
      get copyWith => throw _privateConstructorUsedError;
}
