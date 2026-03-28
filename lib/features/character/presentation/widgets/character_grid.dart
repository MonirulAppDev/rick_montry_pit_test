import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/character_detail_page.dart';
import '../providers/character_provider.dart';
import '../providers/character_state.dart';
import 'character_card.dart';
import 'character_shimmer.dart';
import '../../../../core/common/widgets/offline_widget.dart';

class CharacterGrid extends ConsumerWidget {
  final CharacterState state;
  final ScrollController scrollController;
  final String heroPrefix;

  const CharacterGrid({
    super.key,
    required this.state,
    required this.scrollController,
    this.heroPrefix = 'character',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900
            ? 5
            : constraints.maxWidth > 600
                ? 3
                : 2;

        if (state.isLoading && state.characters.isEmpty) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: 0.7,
            ),
            itemCount: 10,
            itemBuilder: (context, index) => const CharacterShimmer(),
          );
        }

        if (state.errorMessage != null && state.characters.isEmpty) {
          final isOffline =
              state.errorMessage!.toLowerCase().contains('internet');
          return OfflineWidget(
            title: isOffline ? 'Oops! You\'re Offline' : 'Something went wrong',
            message: state.errorMessage!,
            onRetry: () =>
                ref.read(charactersProvider.notifier).fetchCharacters(),
          );
        }

        if (state.characters.isEmpty) {
          return OfflineWidget(
            title: 'No Characters',
            message: 'We couldn\'t find any characters matching your filters.',
            onRetry: () =>
                ref.read(charactersProvider.notifier).fetchCharacters(),
          );
        }

        return RefreshIndicator(
          color: const Color(0xFF6B38FB),
          onRefresh: () async {
            await ref.read(charactersProvider.notifier).fetchCharacters();
          },
          child: GridView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: 0.7,
            ),
            itemCount: state.characters.length +
                (state.isLoadingMore ? crossAxisCount : 0),
            itemBuilder: (context, index) {
              if (index < state.characters.length) {
                final character = state.characters[index];
                return CharacterCard(
                  character: character,
                  heroPrefix: heroPrefix,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetailPage(
                          character: character,
                          heroPrefix: heroPrefix,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const CharacterShimmer();
              }
            },
          ),
        );
      },
    );
  }
}
