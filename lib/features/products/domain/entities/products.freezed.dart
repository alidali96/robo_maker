// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductsTearOff {
  const _$ProductsTearOff();

  _Products call({required List<Product> list}) {
    return _Products(
      list: list,
    );
  }
}

/// @nodoc
const $Products = _$ProductsTearOff();

/// @nodoc
mixin _$Products {
  List<Product> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsCopyWith<Products> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsCopyWith<$Res> {
  factory $ProductsCopyWith(Products value, $Res Function(Products) then) =
      _$ProductsCopyWithImpl<$Res>;
  $Res call({List<Product> list});
}

/// @nodoc
class _$ProductsCopyWithImpl<$Res> implements $ProductsCopyWith<$Res> {
  _$ProductsCopyWithImpl(this._value, this._then);

  final Products _value;
  // ignore: unused_field
  final $Res Function(Products) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
abstract class _$ProductsCopyWith<$Res> implements $ProductsCopyWith<$Res> {
  factory _$ProductsCopyWith(_Products value, $Res Function(_Products) then) =
      __$ProductsCopyWithImpl<$Res>;
  @override
  $Res call({List<Product> list});
}

/// @nodoc
class __$ProductsCopyWithImpl<$Res> extends _$ProductsCopyWithImpl<$Res>
    implements _$ProductsCopyWith<$Res> {
  __$ProductsCopyWithImpl(_Products _value, $Res Function(_Products) _then)
      : super(_value, (v) => _then(v as _Products));

  @override
  _Products get _value => super._value as _Products;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_Products(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_Products implements _Products {
  const _$_Products({required this.list});

  @override
  final List<Product> list;

  @override
  String toString() {
    return 'Products(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Products &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(list);

  @JsonKey(ignore: true)
  @override
  _$ProductsCopyWith<_Products> get copyWith =>
      __$ProductsCopyWithImpl<_Products>(this, _$identity);
}

abstract class _Products implements Products {
  const factory _Products({required List<Product> list}) = _$_Products;

  @override
  List<Product> get list => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductsCopyWith<_Products> get copyWith =>
      throw _privateConstructorUsedError;
}
