// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customize_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomizeModel {
  BeerculesCardType? get selectedCardType => throw _privateConstructorUsedError;
  List<CustomizeModelCard> get cards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomizeModelCopyWith<CustomizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizeModelCopyWith<$Res> {
  factory $CustomizeModelCopyWith(
          CustomizeModel value, $Res Function(CustomizeModel) then) =
      _$CustomizeModelCopyWithImpl<$Res, CustomizeModel>;
  @useResult
  $Res call(
      {BeerculesCardType? selectedCardType, List<CustomizeModelCard> cards});
}

/// @nodoc
class _$CustomizeModelCopyWithImpl<$Res, $Val extends CustomizeModel>
    implements $CustomizeModelCopyWith<$Res> {
  _$CustomizeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCardType = freezed,
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      selectedCardType: freezed == selectedCardType
          ? _value.selectedCardType
          : selectedCardType // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType?,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CustomizeModelCard>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomizeModelImplCopyWith<$Res>
    implements $CustomizeModelCopyWith<$Res> {
  factory _$$CustomizeModelImplCopyWith(_$CustomizeModelImpl value,
          $Res Function(_$CustomizeModelImpl) then) =
      __$$CustomizeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerculesCardType? selectedCardType, List<CustomizeModelCard> cards});
}

/// @nodoc
class __$$CustomizeModelImplCopyWithImpl<$Res>
    extends _$CustomizeModelCopyWithImpl<$Res, _$CustomizeModelImpl>
    implements _$$CustomizeModelImplCopyWith<$Res> {
  __$$CustomizeModelImplCopyWithImpl(
      _$CustomizeModelImpl _value, $Res Function(_$CustomizeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCardType = freezed,
    Object? cards = null,
  }) {
    return _then(_$CustomizeModelImpl(
      selectedCardType: freezed == selectedCardType
          ? _value.selectedCardType
          : selectedCardType // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType?,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CustomizeModelCard>,
    ));
  }
}

/// @nodoc

class _$CustomizeModelImpl implements _CustomizeModel {
  _$CustomizeModelImpl(
      {required this.selectedCardType,
      required final List<CustomizeModelCard> cards})
      : _cards = cards;

  @override
  final BeerculesCardType? selectedCardType;
  final List<CustomizeModelCard> _cards;
  @override
  List<CustomizeModelCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'CustomizeModel(selectedCardType: $selectedCardType, cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizeModelImpl &&
            (identical(other.selectedCardType, selectedCardType) ||
                other.selectedCardType == selectedCardType) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCardType,
      const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizeModelImplCopyWith<_$CustomizeModelImpl> get copyWith =>
      __$$CustomizeModelImplCopyWithImpl<_$CustomizeModelImpl>(
          this, _$identity);
}

abstract class _CustomizeModel implements CustomizeModel {
  factory _CustomizeModel(
      {required final BeerculesCardType? selectedCardType,
      required final List<CustomizeModelCard> cards}) = _$CustomizeModelImpl;

  @override
  BeerculesCardType? get selectedCardType;
  @override
  List<CustomizeModelCard> get cards;
  @override
  @JsonKey(ignore: true)
  _$$CustomizeModelImplCopyWith<_$CustomizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomizeModelCard {
  BeerculesCardType get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomizeModelCardCopyWith<CustomizeModelCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizeModelCardCopyWith<$Res> {
  factory $CustomizeModelCardCopyWith(
          CustomizeModelCard value, $Res Function(CustomizeModelCard) then) =
      _$CustomizeModelCardCopyWithImpl<$Res, CustomizeModelCard>;
  @useResult
  $Res call({BeerculesCardType type, int amount});
}

/// @nodoc
class _$CustomizeModelCardCopyWithImpl<$Res, $Val extends CustomizeModelCard>
    implements $CustomizeModelCardCopyWith<$Res> {
  _$CustomizeModelCardCopyWithImpl(this._value, this._then);

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
abstract class _$$CustomizeModelCardImplCopyWith<$Res>
    implements $CustomizeModelCardCopyWith<$Res> {
  factory _$$CustomizeModelCardImplCopyWith(_$CustomizeModelCardImpl value,
          $Res Function(_$CustomizeModelCardImpl) then) =
      __$$CustomizeModelCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerculesCardType type, int amount});
}

/// @nodoc
class __$$CustomizeModelCardImplCopyWithImpl<$Res>
    extends _$CustomizeModelCardCopyWithImpl<$Res, _$CustomizeModelCardImpl>
    implements _$$CustomizeModelCardImplCopyWith<$Res> {
  __$$CustomizeModelCardImplCopyWithImpl(_$CustomizeModelCardImpl _value,
      $Res Function(_$CustomizeModelCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$CustomizeModelCardImpl(
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

class _$CustomizeModelCardImpl implements _CustomizeModelCard {
  _$CustomizeModelCardImpl({required this.type, required this.amount});

  @override
  final BeerculesCardType type;
  @override
  final int amount;

  @override
  String toString() {
    return 'CustomizeModelCard(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizeModelCardImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizeModelCardImplCopyWith<_$CustomizeModelCardImpl> get copyWith =>
      __$$CustomizeModelCardImplCopyWithImpl<_$CustomizeModelCardImpl>(
          this, _$identity);
}

abstract class _CustomizeModelCard implements CustomizeModelCard {
  factory _CustomizeModelCard(
      {required final BeerculesCardType type,
      required final int amount}) = _$CustomizeModelCardImpl;

  @override
  BeerculesCardType get type;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$CustomizeModelCardImplCopyWith<_$CustomizeModelCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
