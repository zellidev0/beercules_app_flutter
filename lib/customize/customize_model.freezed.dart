// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customize_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomizeModelTearOff {
  const _$CustomizeModelTearOff();

  _CustomizeModel call(
      {required String? selectedCardKey,
      required List<BeerculesCard> configCards}) {
    return _CustomizeModel(
      selectedCardKey: selectedCardKey,
      configCards: configCards,
    );
  }
}

/// @nodoc
const $CustomizeModel = _$CustomizeModelTearOff();

/// @nodoc
mixin _$CustomizeModel {
  String? get selectedCardKey => throw _privateConstructorUsedError;
  List<BeerculesCard> get configCards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomizeModelCopyWith<CustomizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizeModelCopyWith<$Res> {
  factory $CustomizeModelCopyWith(
          CustomizeModel value, $Res Function(CustomizeModel) then) =
      _$CustomizeModelCopyWithImpl<$Res>;
  $Res call({String? selectedCardKey, List<BeerculesCard> configCards});
}

/// @nodoc
class _$CustomizeModelCopyWithImpl<$Res>
    implements $CustomizeModelCopyWith<$Res> {
  _$CustomizeModelCopyWithImpl(this._value, this._then);

  final CustomizeModel _value;
  // ignore: unused_field
  final $Res Function(CustomizeModel) _then;

  @override
  $Res call({
    Object? selectedCardKey = freezed,
    Object? configCards = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCardKey: selectedCardKey == freezed
          ? _value.selectedCardKey
          : selectedCardKey // ignore: cast_nullable_to_non_nullable
              as String?,
      configCards: configCards == freezed
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ));
  }
}

/// @nodoc
abstract class _$CustomizeModelCopyWith<$Res>
    implements $CustomizeModelCopyWith<$Res> {
  factory _$CustomizeModelCopyWith(
          _CustomizeModel value, $Res Function(_CustomizeModel) then) =
      __$CustomizeModelCopyWithImpl<$Res>;
  @override
  $Res call({String? selectedCardKey, List<BeerculesCard> configCards});
}

/// @nodoc
class __$CustomizeModelCopyWithImpl<$Res>
    extends _$CustomizeModelCopyWithImpl<$Res>
    implements _$CustomizeModelCopyWith<$Res> {
  __$CustomizeModelCopyWithImpl(
      _CustomizeModel _value, $Res Function(_CustomizeModel) _then)
      : super(_value, (v) => _then(v as _CustomizeModel));

  @override
  _CustomizeModel get _value => super._value as _CustomizeModel;

  @override
  $Res call({
    Object? selectedCardKey = freezed,
    Object? configCards = freezed,
  }) {
    return _then(_CustomizeModel(
      selectedCardKey: selectedCardKey == freezed
          ? _value.selectedCardKey
          : selectedCardKey // ignore: cast_nullable_to_non_nullable
              as String?,
      configCards: configCards == freezed
          ? _value.configCards
          : configCards // ignore: cast_nullable_to_non_nullable
              as List<BeerculesCard>,
    ));
  }
}

/// @nodoc

class _$_CustomizeModel implements _CustomizeModel {
  _$_CustomizeModel({required this.selectedCardKey, required this.configCards});

  @override
  final String? selectedCardKey;
  @override
  final List<BeerculesCard> configCards;

  @override
  String toString() {
    return 'CustomizeModel(selectedCardKey: $selectedCardKey, configCards: $configCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomizeModel &&
            const DeepCollectionEquality()
                .equals(other.selectedCardKey, selectedCardKey) &&
            const DeepCollectionEquality()
                .equals(other.configCards, configCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedCardKey),
      const DeepCollectionEquality().hash(configCards));

  @JsonKey(ignore: true)
  @override
  _$CustomizeModelCopyWith<_CustomizeModel> get copyWith =>
      __$CustomizeModelCopyWithImpl<_CustomizeModel>(this, _$identity);
}

abstract class _CustomizeModel implements CustomizeModel {
  factory _CustomizeModel(
      {required String? selectedCardKey,
      required List<BeerculesCard> configCards}) = _$_CustomizeModel;

  @override
  String? get selectedCardKey;
  @override
  List<BeerculesCard> get configCards;
  @override
  @JsonKey(ignore: true)
  _$CustomizeModelCopyWith<_CustomizeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
