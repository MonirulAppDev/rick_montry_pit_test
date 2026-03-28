// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterState {

 List<Character> get characters; Map<String, List<Character>> get cache; Map<String, bool> get isLastPageCache; int get currentPage; bool get isLoadingMore; bool get isLastPage; bool get isLoading; String? get errorMessage; String? get searchName; String? get statusFilter; String? get speciesFilter;
/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterStateCopyWith<CharacterState> get copyWith => _$CharacterStateCopyWithImpl<CharacterState>(this as CharacterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterState&&const DeepCollectionEquality().equals(other.characters, characters)&&const DeepCollectionEquality().equals(other.cache, cache)&&const DeepCollectionEquality().equals(other.isLastPageCache, isLastPageCache)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchName, searchName) || other.searchName == searchName)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.speciesFilter, speciesFilter) || other.speciesFilter == speciesFilter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(characters),const DeepCollectionEquality().hash(cache),const DeepCollectionEquality().hash(isLastPageCache),currentPage,isLoadingMore,isLastPage,isLoading,errorMessage,searchName,statusFilter,speciesFilter);

@override
String toString() {
  return 'CharacterState(characters: $characters, cache: $cache, isLastPageCache: $isLastPageCache, currentPage: $currentPage, isLoadingMore: $isLoadingMore, isLastPage: $isLastPage, isLoading: $isLoading, errorMessage: $errorMessage, searchName: $searchName, statusFilter: $statusFilter, speciesFilter: $speciesFilter)';
}


}

/// @nodoc
abstract mixin class $CharacterStateCopyWith<$Res>  {
  factory $CharacterStateCopyWith(CharacterState value, $Res Function(CharacterState) _then) = _$CharacterStateCopyWithImpl;
@useResult
$Res call({
 List<Character> characters, Map<String, List<Character>> cache, Map<String, bool> isLastPageCache, int currentPage, bool isLoadingMore, bool isLastPage, bool isLoading, String? errorMessage, String? searchName, String? statusFilter, String? speciesFilter
});




}
/// @nodoc
class _$CharacterStateCopyWithImpl<$Res>
    implements $CharacterStateCopyWith<$Res> {
  _$CharacterStateCopyWithImpl(this._self, this._then);

  final CharacterState _self;
  final $Res Function(CharacterState) _then;

/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characters = null,Object? cache = null,Object? isLastPageCache = null,Object? currentPage = null,Object? isLoadingMore = null,Object? isLastPage = null,Object? isLoading = null,Object? errorMessage = freezed,Object? searchName = freezed,Object? statusFilter = freezed,Object? speciesFilter = freezed,}) {
  return _then(_self.copyWith(
characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as Map<String, List<Character>>,isLastPageCache: null == isLastPageCache ? _self.isLastPageCache : isLastPageCache // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchName: freezed == searchName ? _self.searchName : searchName // ignore: cast_nullable_to_non_nullable
as String?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as String?,speciesFilter: freezed == speciesFilter ? _self.speciesFilter : speciesFilter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterState].
extension CharacterStatePatterns on CharacterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterState value)  $default,){
final _that = this;
switch (_that) {
case _CharacterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterState value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Character> characters,  Map<String, List<Character>> cache,  Map<String, bool> isLastPageCache,  int currentPage,  bool isLoadingMore,  bool isLastPage,  bool isLoading,  String? errorMessage,  String? searchName,  String? statusFilter,  String? speciesFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterState() when $default != null:
return $default(_that.characters,_that.cache,_that.isLastPageCache,_that.currentPage,_that.isLoadingMore,_that.isLastPage,_that.isLoading,_that.errorMessage,_that.searchName,_that.statusFilter,_that.speciesFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Character> characters,  Map<String, List<Character>> cache,  Map<String, bool> isLastPageCache,  int currentPage,  bool isLoadingMore,  bool isLastPage,  bool isLoading,  String? errorMessage,  String? searchName,  String? statusFilter,  String? speciesFilter)  $default,) {final _that = this;
switch (_that) {
case _CharacterState():
return $default(_that.characters,_that.cache,_that.isLastPageCache,_that.currentPage,_that.isLoadingMore,_that.isLastPage,_that.isLoading,_that.errorMessage,_that.searchName,_that.statusFilter,_that.speciesFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Character> characters,  Map<String, List<Character>> cache,  Map<String, bool> isLastPageCache,  int currentPage,  bool isLoadingMore,  bool isLastPage,  bool isLoading,  String? errorMessage,  String? searchName,  String? statusFilter,  String? speciesFilter)?  $default,) {final _that = this;
switch (_that) {
case _CharacterState() when $default != null:
return $default(_that.characters,_that.cache,_that.isLastPageCache,_that.currentPage,_that.isLoadingMore,_that.isLastPage,_that.isLoading,_that.errorMessage,_that.searchName,_that.statusFilter,_that.speciesFilter);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterState implements CharacterState {
  const _CharacterState({final  List<Character> characters = const [], final  Map<String, List<Character>> cache = const {}, final  Map<String, bool> isLastPageCache = const {}, this.currentPage = 1, this.isLoadingMore = false, this.isLastPage = false, this.isLoading = true, this.errorMessage, this.searchName, this.statusFilter, this.speciesFilter}): _characters = characters,_cache = cache,_isLastPageCache = isLastPageCache;
  

 final  List<Character> _characters;
@override@JsonKey() List<Character> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}

 final  Map<String, List<Character>> _cache;
@override@JsonKey() Map<String, List<Character>> get cache {
  if (_cache is EqualUnmodifiableMapView) return _cache;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_cache);
}

 final  Map<String, bool> _isLastPageCache;
@override@JsonKey() Map<String, bool> get isLastPageCache {
  if (_isLastPageCache is EqualUnmodifiableMapView) return _isLastPageCache;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_isLastPageCache);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isLastPage;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  String? searchName;
@override final  String? statusFilter;
@override final  String? speciesFilter;

/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterStateCopyWith<_CharacterState> get copyWith => __$CharacterStateCopyWithImpl<_CharacterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterState&&const DeepCollectionEquality().equals(other._characters, _characters)&&const DeepCollectionEquality().equals(other._cache, _cache)&&const DeepCollectionEquality().equals(other._isLastPageCache, _isLastPageCache)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchName, searchName) || other.searchName == searchName)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.speciesFilter, speciesFilter) || other.speciesFilter == speciesFilter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters),const DeepCollectionEquality().hash(_cache),const DeepCollectionEquality().hash(_isLastPageCache),currentPage,isLoadingMore,isLastPage,isLoading,errorMessage,searchName,statusFilter,speciesFilter);

@override
String toString() {
  return 'CharacterState(characters: $characters, cache: $cache, isLastPageCache: $isLastPageCache, currentPage: $currentPage, isLoadingMore: $isLoadingMore, isLastPage: $isLastPage, isLoading: $isLoading, errorMessage: $errorMessage, searchName: $searchName, statusFilter: $statusFilter, speciesFilter: $speciesFilter)';
}


}

/// @nodoc
abstract mixin class _$CharacterStateCopyWith<$Res> implements $CharacterStateCopyWith<$Res> {
  factory _$CharacterStateCopyWith(_CharacterState value, $Res Function(_CharacterState) _then) = __$CharacterStateCopyWithImpl;
@override @useResult
$Res call({
 List<Character> characters, Map<String, List<Character>> cache, Map<String, bool> isLastPageCache, int currentPage, bool isLoadingMore, bool isLastPage, bool isLoading, String? errorMessage, String? searchName, String? statusFilter, String? speciesFilter
});




}
/// @nodoc
class __$CharacterStateCopyWithImpl<$Res>
    implements _$CharacterStateCopyWith<$Res> {
  __$CharacterStateCopyWithImpl(this._self, this._then);

  final _CharacterState _self;
  final $Res Function(_CharacterState) _then;

/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characters = null,Object? cache = null,Object? isLastPageCache = null,Object? currentPage = null,Object? isLoadingMore = null,Object? isLastPage = null,Object? isLoading = null,Object? errorMessage = freezed,Object? searchName = freezed,Object? statusFilter = freezed,Object? speciesFilter = freezed,}) {
  return _then(_CharacterState(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,cache: null == cache ? _self._cache : cache // ignore: cast_nullable_to_non_nullable
as Map<String, List<Character>>,isLastPageCache: null == isLastPageCache ? _self._isLastPageCache : isLastPageCache // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchName: freezed == searchName ? _self.searchName : searchName // ignore: cast_nullable_to_non_nullable
as String?,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as String?,speciesFilter: freezed == speciesFilter ? _self.speciesFilter : speciesFilter // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
