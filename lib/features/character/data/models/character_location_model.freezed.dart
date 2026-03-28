// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterLocationModel {

 String get name; String get url;
/// Create a copy of CharacterLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterLocationModelCopyWith<CharacterLocationModel> get copyWith => _$CharacterLocationModelCopyWithImpl<CharacterLocationModel>(this as CharacterLocationModel, _$identity);

  /// Serializes this CharacterLocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterLocationModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'CharacterLocationModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $CharacterLocationModelCopyWith<$Res>  {
  factory $CharacterLocationModelCopyWith(CharacterLocationModel value, $Res Function(CharacterLocationModel) _then) = _$CharacterLocationModelCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$CharacterLocationModelCopyWithImpl<$Res>
    implements $CharacterLocationModelCopyWith<$Res> {
  _$CharacterLocationModelCopyWithImpl(this._self, this._then);

  final CharacterLocationModel _self;
  final $Res Function(CharacterLocationModel) _then;

/// Create a copy of CharacterLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterLocationModel].
extension CharacterLocationModelPatterns on CharacterLocationModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterLocationModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterLocationModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterLocationModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterLocationModel() when $default != null:
return $default(_that.name,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _CharacterLocationModel():
return $default(_that.name,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _CharacterLocationModel() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterLocationModel implements CharacterLocationModel {
  const _CharacterLocationModel({required this.name, required this.url});
  factory _CharacterLocationModel.fromJson(Map<String, dynamic> json) => _$CharacterLocationModelFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of CharacterLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterLocationModelCopyWith<_CharacterLocationModel> get copyWith => __$CharacterLocationModelCopyWithImpl<_CharacterLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterLocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterLocationModel&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'CharacterLocationModel(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$CharacterLocationModelCopyWith<$Res> implements $CharacterLocationModelCopyWith<$Res> {
  factory _$CharacterLocationModelCopyWith(_CharacterLocationModel value, $Res Function(_CharacterLocationModel) _then) = __$CharacterLocationModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$CharacterLocationModelCopyWithImpl<$Res>
    implements _$CharacterLocationModelCopyWith<$Res> {
  __$CharacterLocationModelCopyWithImpl(this._self, this._then);

  final _CharacterLocationModel _self;
  final $Res Function(_CharacterLocationModel) _then;

/// Create a copy of CharacterLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_CharacterLocationModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
