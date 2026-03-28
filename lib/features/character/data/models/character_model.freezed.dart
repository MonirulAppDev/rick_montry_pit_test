// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterModel {

 int get id; String get name; String get status; String get species; String get image; String get type; String get gender; String get url; String get created; CharacterLocationModel get origin; CharacterLocationModel get location; List<String> get episode;
/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterModelCopyWith<CharacterModel> get copyWith => _$CharacterModelCopyWithImpl<CharacterModel>(this as CharacterModel, _$identity);

  /// Serializes this CharacterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.image, image) || other.image == image)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.episode, episode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,image,type,gender,url,created,origin,location,const DeepCollectionEquality().hash(episode));

@override
String toString() {
  return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, image: $image, type: $type, gender: $gender, url: $url, created: $created, origin: $origin, location: $location, episode: $episode)';
}


}

/// @nodoc
abstract mixin class $CharacterModelCopyWith<$Res>  {
  factory $CharacterModelCopyWith(CharacterModel value, $Res Function(CharacterModel) _then) = _$CharacterModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String status, String species, String image, String type, String gender, String url, String created, CharacterLocationModel origin, CharacterLocationModel location, List<String> episode
});


$CharacterLocationModelCopyWith<$Res> get origin;$CharacterLocationModelCopyWith<$Res> get location;

}
/// @nodoc
class _$CharacterModelCopyWithImpl<$Res>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._self, this._then);

  final CharacterModel _self;
  final $Res Function(CharacterModel) _then;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? image = null,Object? type = null,Object? gender = null,Object? url = null,Object? created = null,Object? origin = null,Object? location = null,Object? episode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterLocationModel,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterLocationModel,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationModelCopyWith<$Res> get origin {
  
  return $CharacterLocationModelCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationModelCopyWith<$Res> get location {
  
  return $CharacterLocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharacterModel].
extension CharacterModelPatterns on CharacterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterModel value)  $default,){
final _that = this;
switch (_that) {
case _CharacterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterModel value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String status,  String species,  String image,  String type,  String gender,  String url,  String created,  CharacterLocationModel origin,  CharacterLocationModel location,  List<String> episode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.image,_that.type,_that.gender,_that.url,_that.created,_that.origin,_that.location,_that.episode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String status,  String species,  String image,  String type,  String gender,  String url,  String created,  CharacterLocationModel origin,  CharacterLocationModel location,  List<String> episode)  $default,) {final _that = this;
switch (_that) {
case _CharacterModel():
return $default(_that.id,_that.name,_that.status,_that.species,_that.image,_that.type,_that.gender,_that.url,_that.created,_that.origin,_that.location,_that.episode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String status,  String species,  String image,  String type,  String gender,  String url,  String created,  CharacterLocationModel origin,  CharacterLocationModel location,  List<String> episode)?  $default,) {final _that = this;
switch (_that) {
case _CharacterModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.image,_that.type,_that.gender,_that.url,_that.created,_that.origin,_that.location,_that.episode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterModel implements CharacterModel {
  const _CharacterModel({required this.id, required this.name, required this.status, required this.species, required this.image, required this.type, required this.gender, required this.url, required this.created, required this.origin, required this.location, required final  List<String> episode}): _episode = episode;
  factory _CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String status;
@override final  String species;
@override final  String image;
@override final  String type;
@override final  String gender;
@override final  String url;
@override final  String created;
@override final  CharacterLocationModel origin;
@override final  CharacterLocationModel location;
 final  List<String> _episode;
@override List<String> get episode {
  if (_episode is EqualUnmodifiableListView) return _episode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episode);
}


/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterModelCopyWith<_CharacterModel> get copyWith => __$CharacterModelCopyWithImpl<_CharacterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.image, image) || other.image == image)&&(identical(other.type, type) || other.type == type)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.url, url) || other.url == url)&&(identical(other.created, created) || other.created == created)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._episode, _episode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,species,image,type,gender,url,created,origin,location,const DeepCollectionEquality().hash(_episode));

@override
String toString() {
  return 'CharacterModel(id: $id, name: $name, status: $status, species: $species, image: $image, type: $type, gender: $gender, url: $url, created: $created, origin: $origin, location: $location, episode: $episode)';
}


}

/// @nodoc
abstract mixin class _$CharacterModelCopyWith<$Res> implements $CharacterModelCopyWith<$Res> {
  factory _$CharacterModelCopyWith(_CharacterModel value, $Res Function(_CharacterModel) _then) = __$CharacterModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String status, String species, String image, String type, String gender, String url, String created, CharacterLocationModel origin, CharacterLocationModel location, List<String> episode
});


@override $CharacterLocationModelCopyWith<$Res> get origin;@override $CharacterLocationModelCopyWith<$Res> get location;

}
/// @nodoc
class __$CharacterModelCopyWithImpl<$Res>
    implements _$CharacterModelCopyWith<$Res> {
  __$CharacterModelCopyWithImpl(this._self, this._then);

  final _CharacterModel _self;
  final $Res Function(_CharacterModel) _then;

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? image = null,Object? type = null,Object? gender = null,Object? url = null,Object? created = null,Object? origin = null,Object? location = null,Object? episode = null,}) {
  return _then(_CharacterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as CharacterLocationModel,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as CharacterLocationModel,episode: null == episode ? _self._episode : episode // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationModelCopyWith<$Res> get origin {
  
  return $CharacterLocationModelCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of CharacterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterLocationModelCopyWith<$Res> get location {
  
  return $CharacterLocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
