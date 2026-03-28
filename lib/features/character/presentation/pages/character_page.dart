import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../widgets/character_card.dart';
import '../widgets/character_shimmer.dart';
import '../widgets/offline_widget.dart';
import 'character_detail_page.dart';

class CharacterPage extends ConsumerWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 900
              ? 5
              : constraints.maxWidth > 600
                  ? 3
                  : 2;

          return RefreshIndicator(
            color: const Color(0xFF6B38FB),
            onRefresh: () async {
              await ref.read(charactersProvider.notifier).fetchCharacters();
            },
            child: characterState.when(
              data: (characters) {
                if (characters.isEmpty) {
                  return OfflineWidget(
                    message: 'No characters found.',
                    onRetry: () => ref.read(charactersProvider.notifier).fetchCharacters(),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    return CharacterCard(
                      character: character,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetailPage(character: character),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              error: (error, stack) => OfflineWidget(
                message: error.toString(),
                onRetry: () => ref.read(charactersProvider.notifier).fetchCharacters(),
              ),
              loading: () => GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.7,
                ),
                itemCount: 10,
                itemBuilder: (context, index) => const CharacterShimmer(),
              ),
            ),
          );
        },
      ),
    );
  }
}
