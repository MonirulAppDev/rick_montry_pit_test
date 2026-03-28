import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/character.dart';

part 'character_state.freezed.dart';

@freezed
abstract class CharacterState with _$CharacterState {
  const factory CharacterState({
    @Default([]) List<Character> characters,
    @Default({}) Map<String, List<Character>> cache,
    @Default({}) Map<String, bool> isLastPageCache,
    @Default(1) int currentPage,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isLastPage,
    @Default(true) bool isLoading,
    String? errorMessage,
    String? searchName,
    String? statusFilter,
    String? speciesFilter,
  }) = _CharacterState;
}
