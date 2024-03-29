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
  BeerculesCardType? get selectedCardKey => throw _privateConstructorUsedError;
  List<BeerculesCard> get configCards => throw _privateConstructorUsedError;

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
      {BeerculesCardType? selectedCardKey, List<BeerculesCard> configCards});
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
    Object? selectedCardKey = freezed,
    Object? configCards = null,
  }) {
    return _then(_value.copyWith(
      selectedCardKey: freezed == selectedCardKey
          ? _value.selectedCardKey
          : selectedCardKey // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType?,
      configCards: null == configCards
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
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
      {BeerculesCardType? selectedCardKey, List<BeerculesCard> configCards});
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
    Object? selectedCardKey = freezed,
    Object? configCards = null,
  }) {
    return _then(_$CustomizeModelImpl(
      selectedCardKey: freezed == selectedCardKey
          ? _value.selectedCardKey
          : selectedCardKey // ignore: cast_nullable_to_non_nullable
              as BeerculesCardType?,
      configCards: null == configCards
          ? _value._configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ));
  }
}

/// @nodoc

class _$CustomizeModelImpl implements _CustomizeModel {
  _$CustomizeModelImpl(
      {required this.selectedCardKey,
      required final List<BeerculesCard> configCards})
      : _configCards = configCards;

  @override
  final BeerculesCardType? selectedCardKey;
  final List<BeerculesCard> _configCards;
  @override
  List<BeerculesCard> get configCards {
    if (_configCards is EqualUnmodifiableListView) return _configCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configCards);
  }

  @override
  String toString() {
    return 'CustomizeModel(selectedCardKey: $selectedCardKey, configCards: $configCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomizeModelImpl &&
            (identical(other.selectedCardKey, selectedCardKey) ||
                other.selectedCardKey == selectedCardKey) &&
            const DeepCollectionEquality()
                .equals(other._configCards, _configCards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCardKey,
      const DeepCollectionEquality().hash(_configCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizeModelImplCopyWith<_$CustomizeModelImpl> get copyWith =>
      __$$CustomizeModelImplCopyWithImpl<_$CustomizeModelImpl>(
          this, _$identity);
}

abstract class _CustomizeModel implements CustomizeModel {
  factory _CustomizeModel(
      {required final BeerculesCardType? selectedCardKey,
      required final List<BeerculesCard> configCards}) = _$CustomizeModelImpl;

  @override
  BeerculesCardType? get selectedCardKey;
  @override
  List<BeerculesCard> get configCards;
  @override
  @JsonKey(ignore: true)
  _$$CustomizeModelImplCopyWith<_$CustomizeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
