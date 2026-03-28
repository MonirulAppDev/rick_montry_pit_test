import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../providers/character_state.dart';
import '../widgets/character_card.dart';
import '../widgets/character_shimmer.dart';
import '../widgets/offline_widget.dart';
import 'character_detail_page.dart';

class CharacterPage extends ConsumerStatefulWidget {
  const CharacterPage({super.key});

  @override
  ConsumerState<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends ConsumerState<CharacterPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 400) {
        ref.read(charactersProvider.notifier).loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final characterState = ref.watch(charactersProvider);

    // Listen to state changes to handle cases where new data arrives and we
    // are still near the bottom, but no scroll notification was triggered.
    ref.listen(charactersProvider, (previous, next) {
      if (previous?.isLoadingMore == true && next.isLoadingMore == false) {
        // If we finished loading more, check if we're still near the bottom
        // in case the newly added items didn't push the threshold far enough.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _onScroll();
        });
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Characters'), centerTitle: true),
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
            child: _buildBody(characterState, crossAxisCount),
          );
        },
      ),
    );
  }

  Widget _buildBody(CharacterState state, int crossAxisCount) {
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
      return OfflineWidget(
        message: state.errorMessage!,
        onRetry: () => ref.read(charactersProvider.notifier).fetchCharacters(),
      );
    }

    if (state.characters.isEmpty) {
      return OfflineWidget(
        message: 'No characters found.',
        onRetry: () => ref.read(charactersProvider.notifier).fetchCharacters(),
      );
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        childAspectRatio: 0.7,
      ),
      itemCount:
          state.characters.length + (state.isLoadingMore ? crossAxisCount : 0),
      itemBuilder: (context, index) {
        if (index < state.characters.length) {
          final character = state.characters[index];
          return CharacterCard(
            character: character,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CharacterDetailPage(character: character),
                ),
              );
            },
          );
        } else {
          return const CharacterShimmer();
        }
      },
    );
  }
}
