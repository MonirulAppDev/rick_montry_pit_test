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

 List<Character> get characters; int get currentPage; bool get isLoadingMore; bool get isLastPage; bool get isLoading; String? get errorMessage;
/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterStateCopyWith<CharacterState> get copyWith => _$CharacterStateCopyWithImpl<CharacterState>(this as CharacterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterState&&const DeepCollectionEquality().equals(other.characters, characters)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(characters),currentPage,isLoadingMore,isLastPage,isLoading,errorMessage);

@override
String toString() {
  return 'CharacterState(characters: $characters, currentPage: $currentPage, isLoadingMore: $isLoadingMore, isLastPage: $isLastPage, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CharacterStateCopyWith<$Res>  {
  factory $CharacterStateCopyWith(CharacterState value, $Res Function(CharacterState) _then) = _$CharacterStateCopyWithImpl;
@useResult
$Res call({
 List<Character> characters, int currentPage, bool isLoadingMore, bool isLastPage, bool isLoading, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? characters = null,Object? currentPage = null,Object? isLoadingMore = null,Object? isLastPage = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Character> characters,  int currentPage,  bool isLoadingMore,  bool isLastPage,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterState() when $default != null:
return $default(_that.characters,_that.currentPage,_that.isLoadingMore,_that.isLastPage,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Character> characters,  int currentPage,  bool isLoadingMore,  bool isLastPage,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CharacterState():
return $default(_that.characters,_that.currentPage,_that.isLoadingMore,_that.isLastPage,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Character> characters,  int currentPage,  bool isLoadingMore,  bool isLastPage,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CharacterState() when $default != null:
return $default(_that.characters,_that.currentPage,_that.isLoadingMore,_that.isLastPage,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CharacterState implements CharacterState {
  const _CharacterState({final  List<Character> characters = const [], this.currentPage = 1, this.isLoadingMore = false, this.isLastPage = false, this.isLoading = true, this.errorMessage}): _characters = characters;
  

 final  List<Character> _characters;
@override@JsonKey() List<Character> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isLastPage;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of CharacterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterStateCopyWith<_CharacterState> get copyWith => __$CharacterStateCopyWithImpl<_CharacterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterState&&const DeepCollectionEquality().equals(other._characters, _characters)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters),currentPage,isLoadingMore,isLastPage,isLoading,errorMessage);

@override
String toString() {
  return 'CharacterState(characters: $characters, currentPage: $currentPage, isLoadingMore: $isLoadingMore, isLastPage: $isLastPage, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CharacterStateCopyWith<$Res> implements $CharacterStateCopyWith<$Res> {
  factory _$CharacterStateCopyWith(_CharacterState value, $Res Function(_CharacterState) _then) = __$CharacterStateCopyWithImpl;
@override @useResult
$Res call({
 List<Character> characters, int currentPage, bool isLoadingMore, bool isLastPage, bool isLoading, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? characters = null,Object? currentPage = null,Object? isLoadingMore = null,Object? isLastPage = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_CharacterState(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<Character>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
