import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_all_characters.dart';

final charactersProvider =
    StateNotifierProvider<CharacterNotifier, AsyncValue<List<Character>>>((
      ref,
    ) {
      return CharacterNotifier(sl<GetAllCharacters>());
    });

class CharacterNotifier extends StateNotifier<AsyncValue<List<Character>>> {
  final GetAllCharacters getAllCharacters;

  CharacterNotifier(this.getAllCharacters) : super(const AsyncValue.loading()) {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    state = const AsyncValue.loading();
    final result = await getAllCharacters();
    result.fold(
      (failure) =>
          state = AsyncValue.error(failure.message, StackTrace.current),
      (characters) => state = AsyncValue.data(characters),
    );
  }
}
