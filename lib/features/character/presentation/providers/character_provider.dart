import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:rick_montry_pit_test/core/network/network_info.dart';
import '../../../../injection_container.dart';
import '../../domain/usecases/get_all_characters.dart';
import 'character_state.dart';

final charactersProvider =
    StateNotifierProvider<CharacterNotifier, CharacterState>((ref) {
      return CharacterNotifier(sl<GetAllCharacters>());
    });

class CharacterNotifier extends StateNotifier<CharacterState> {
  final GetAllCharacters getAllCharacters;

  CharacterNotifier(this.getAllCharacters) : super(const CharacterState()) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    state = state.copyWith(isLoading: true, errorMessage: null, currentPage: 1);
    final result = await getAllCharacters(page: 1);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (characters) async {
        final bool isConnected = await sl<NetworkInfo>().isConnected;
        state = state.copyWith(
          isLoading: false,
          characters: characters,
          isLastPage: characters.isEmpty || !isConnected, // If offline, we consider it a 'last page' of available data
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || state.isLastPage) return;

    state = state.copyWith(isLoadingMore: true);
    final nextPage = state.currentPage + 1;
    final result = await getAllCharacters(page: nextPage);

    result.fold((failure) => state = state.copyWith(isLoadingMore: false), (
      newCharacters,
    ) {
      if (newCharacters.isEmpty) {
        state = state.copyWith(isLoadingMore: false, isLastPage: true);
      } else {
        state = state.copyWith(
          isLoadingMore: false,
          characters: [...state.characters, ...newCharacters],
          currentPage: nextPage,
        );
      }
    });
  }

  void updateLocalCharacter(Character updatedCharacter) {
    final updatedCharacters = state.characters.map((c) {
      if (c.id == updatedCharacter.id) {
        return updatedCharacter;
      }
      return c;
    }).toList();
    state = state.copyWith(characters: updatedCharacters);
  }
}
