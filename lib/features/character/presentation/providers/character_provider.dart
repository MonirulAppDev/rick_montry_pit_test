import 'dart:async';
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
  Timer? _debounce;

  CharacterNotifier(this.getAllCharacters) : super(const CharacterState()) {
    fetchCharacters();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  String _getQueryKey(int page, {String? name, String? status, String? species}) {
    return 'page_${page}_name_${name ?? ''}_status_${status ?? ''}_species_${species ?? ''}';
  }

  Future<void> fetchCharacters({bool isInitial = true}) async {
    final String key = _getQueryKey(
      1,
      name: state.searchName,
      status: state.statusFilter,
      species: state.speciesFilter,
    );

    if (isInitial) {
      if (state.cache.containsKey(key)) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: null,
          currentPage: 1,
          characters: state.cache[key]!,
          isLastPage: state.isLastPageCache[key] ?? false,
        );
        return;
      }
      state = state.copyWith(isLoading: true, errorMessage: null, currentPage: 1);
    }

    final result = await getAllCharacters(
      page: 1,
      name: state.searchName,
      status: state.statusFilter,
      species: state.speciesFilter,
    );

    final bool isConnected = await sl<NetworkInfo>().isConnected;

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (characters) {
        final bool isLast = characters.isEmpty || !isConnected;
        final newCache = Map<String, List<Character>>.from(state.cache);
        final newLastPageCache = Map<String, bool>.from(state.isLastPageCache);
        newCache[key] = characters;
        newLastPageCache[key] = isLast;

        state = state.copyWith(
          isLoading: false,
          characters: characters,
          isLastPage: isLast,
          cache: newCache,
          isLastPageCache: newLastPageCache,
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || state.isLastPage) return;

    final nextPage = state.currentPage + 1;
    final String key = _getQueryKey(
      nextPage,
      name: state.searchName,
      status: state.statusFilter,
      species: state.speciesFilter,
    );

    if (state.cache.containsKey(key)) {
      state = state.copyWith(
        characters: [...state.characters, ...state.cache[key]!],
        currentPage: nextPage,
        isLastPage: state.isLastPageCache[key] ?? false,
      );
      return;
    }

    state = state.copyWith(isLoadingMore: true);

    final result = await getAllCharacters(
      page: nextPage,
      name: state.searchName,
      status: state.statusFilter,
      species: state.speciesFilter,
    );

    result.fold((failure) => state = state.copyWith(isLoadingMore: false), (
      newCharacters,
    ) {
      final bool isLast = newCharacters.isEmpty;
      final newCache = Map<String, List<Character>>.from(state.cache);
      final newLastPageCache = Map<String, bool>.from(state.isLastPageCache);
      newCache[key] = newCharacters;
      newLastPageCache[key] = isLast;

      if (isLast) {
        state = state.copyWith(
          isLoadingMore: false,
          isLastPage: true,
          cache: newCache,
          isLastPageCache: newLastPageCache,
        );
      } else {
        state = state.copyWith(
          isLoadingMore: false,
          characters: [...state.characters, ...newCharacters],
          currentPage: nextPage,
          cache: newCache,
          isLastPageCache: newLastPageCache,
        );
      }
    });
  }

  void updateFilters({String? status, String? species}) {
    String? newStatus = state.statusFilter;
    if (status != null) {
      newStatus = (state.statusFilter == status) ? null : status;
    }

    String? newSpecies = state.speciesFilter;
    if (species != null) {
      newSpecies = (state.speciesFilter == species) ? null : species;
    }

    state = state.copyWith(
      statusFilter: newStatus,
      speciesFilter: newSpecies,
    );

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      fetchCharacters();
    });
  }

  void updateSearch(String name) {
    state = state.copyWith(searchName: name.isEmpty ? null : name);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchCharacters();
    });
  }

  void clearFilters() {
    state = state.copyWith(
      searchName: null,
      statusFilter: null,
      speciesFilter: null,
    );
    fetchCharacters();
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
