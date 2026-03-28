import 'package:flutter_riverpod/legacy.dart';
import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/get_favorite_characters.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/toggle_favorite.dart';
import 'package:rick_montry_pit_test/features/character/domain/repositories/favorite_repository.dart';
import 'package:rick_montry_pit_test/injection_container.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<Character>>((ref) {
      return FavoriteNotifier(
        getFavoriteCharacters: sl<GetFavoriteCharacters>(),
        toggleFavorite: sl<ToggleFavorite>(),
        repository: sl<FavoriteRepository>(),
      );
    });

class FavoriteNotifier extends StateNotifier<List<Character>> {
  final GetFavoriteCharacters _getFavoriteCharacters;
  final ToggleFavorite _toggleFavorite;
  final FavoriteRepository _repository;

  FavoriteNotifier({
    required GetFavoriteCharacters getFavoriteCharacters,
    required ToggleFavorite toggleFavorite,
    required FavoriteRepository repository,
  }) : _getFavoriteCharacters = getFavoriteCharacters,
       _toggleFavorite = toggleFavorite,
       _repository = repository,
       super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final result = await _getFavoriteCharacters();
    result.fold((failure) => state = [], (characters) => state = characters);
  }

  Future<void> toggle(Character character) async {
    final result = await _toggleFavorite(character);
    result.fold(
      (failure) => null, // Handle error if needed
      (_) => loadFavorites(),
    );
  }

  bool isFavorite(int id) {
    return _repository.isFavorite(id);
  }
}
