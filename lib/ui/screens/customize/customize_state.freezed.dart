// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customize_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomizeState {
  BeerculesCardType? get selectedCardType => throw _privateConstructorUsedError;
  List<CustomizeModelCard> get configCards =>
      throw _privateConstructorUsedError;

  /// Create a copy of CustomizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomizeStateCopyWith<CustomizeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizeStateCopyWith<$Res> {
  factory $CustomizeStateCopyWith(
          CustomizeState value, $Res Function(CustomizeState) then) =
      _$CustomizeStateCopyWithImpl<$Res, CustomizeState>;
  @useResult
  $Res call(
      {BeerculesCardType? selectedCardType,
      List<CustomizeModelCard> configCards});
}

/// @nodoc
class _$CustomizeStateCopyWithImpl<$Res, $Val extends CustomizeState>
    implements $CustomizeStateCopyWith<$Res> {
  _$CustomizeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCardType = freezed,
    Object? configCards = null,
  }) {
    return _then(_value.copyWith(
      selectedCardType: freezed == selectedCardType
          ? _value.selectedCardType
          : selectedCardType // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType?,
      configCards: null == configCards
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<CustomizeModelCard>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomizeStateImplCopyWith<$Res>
    implements $CustomizeStateCopyWith<$Res> {
  factory _$$CustomizeStateImplCopyWith(_$CustomizeStateImpl value,
          $Res Function(_$CustomizeStateImpl) then) =
      __$$CustomizeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerculesCardType? selectedCardType,
      List<CustomizeModelCard> configCards});
}

/// @nodoc
class __$$CustomizeStateImplCopyWithImpl<$Res>
    extends _$CustomizeStateCopyWithImpl<$Res, _$CustomizeStateImpl>
    implements _$$CustomizeStateImplCopyWith<$Res> {
  __$$CustomizeStateImplCopyWithImpl(
      _$CustomizeStateImpl _value, $Res Function(_$CustomizeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomizeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCardType = freezed,
    Object? configCards = null,
  }) {
    return _then(_$CustomizeStateImpl(
      selectedCardType: freezed == selectedCardType
          ? _value.selectedCardType
          : selectedCardType // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType?,
      configCards: null == configCards
          ? _value._configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<CustomizeModelCard>,
    ));
  }
}

/// @nodoc

class _$CustomizeStateImpl implements _CustomizeState {
  _$CustomizeStateImpl(
      {required this.selectedCardType,
      required final List<CustomizeModelCard> configCards})
      : _configCards = configCards;

  @override
  final BeerculesCardType? selectedCardType;
  final List<CustomizeModelCard> _configCards;
  @override
  List<CustomizeModelCard> get configCards {
    if (_configCards is EqualUnmodifiableListView) return _configCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configCards);
  }

  @override
  String toString() {
    return 'CustomizeState(selectedCardType: $selectedCardType, configCards: $configCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizeStateImpl &&
            (identical(other.selectedCardType, selectedCardType) ||
                other.selectedCardType == selectedCardType) &&
            const DeepCollectionEquality()
                .equals(other._configCards, _configCards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCardType,
      const DeepCollectionEquality().hash(_configCards));

  /// Create a copy of CustomizeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizeStateImplCopyWith<_$CustomizeStateImpl> get copyWith =>
      __$$CustomizeStateImplCopyWithImpl<_$CustomizeStateImpl>(
          this, _$identity);
}

abstract class _CustomizeState implements CustomizeState {
  factory _CustomizeState(
          {required final BeerculesCardType? selectedCardType,
          required final List<CustomizeModelCard> configCards}) =
      _$CustomizeStateImpl;

  @override
  BeerculesCardType? get selectedCardType;
  @override
  List<CustomizeModelCard> get configCards;

  /// Create a copy of CustomizeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomizeStateImplCopyWith<_$CustomizeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomizeModelCard {
  BeerculesCardType get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  /// Create a copy of CustomizeModelCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CustomizeModelCard
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CustomizeModelCard
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CustomizeModelCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CustomizeModelCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomizeModelCardImplCopyWith<_$CustomizeModelCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
