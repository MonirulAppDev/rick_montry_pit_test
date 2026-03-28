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
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
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
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search characters...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white38),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: (value) {
                  ref.read(charactersProvider.notifier).updateSearch(value);
                },
              )
            : const Text('Characters'),
        centerTitle: !_isSearching,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _isSearching = false;
                  _searchController.clear();
                  ref.read(charactersProvider.notifier).updateSearch('');
                } else {
                  _isSearching = true;
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterBar(characterState),
          Expanded(
            child: LayoutBuilder(
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
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar(CharacterState state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E26),
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _buildFilterGroup(
              'Status',
              ['Alive', 'Dead', 'Unknown'],
              state.statusFilter,
              (val) => ref.read(charactersProvider.notifier).updateFilters(status: val),
            ),
            const SizedBox(width: 16),
            Container(width: 1, height: 24, color: Colors.white10),
            const SizedBox(width: 16),
            _buildFilterGroup(
              'Species',
              ['Human', 'Alien'],
              state.speciesFilter,
              (val) => ref.read(charactersProvider.notifier).updateFilters(species: val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterGroup(String title, List<String> options, String? currentValue, Function(String) onSelected) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        ...options.map((option) {
          final isSelected = currentValue == option;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ChoiceChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (_) => onSelected(option),
              selectedColor: const Color(0xFF6B38FB),
              backgroundColor: Colors.white.withOpacity(0.05),
              showCheckmark: false,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          );
        }).toList(),
      ],
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
      final isOffline = state.errorMessage!.toLowerCase().contains('internet');
      return OfflineWidget(
        title: isOffline ? 'Oops! You\'re Offline' : 'Something went wrong',
        message: state.errorMessage!,
        onRetry: () => ref.read(charactersProvider.notifier).fetchCharacters(),
      );
    }

    if (state.characters.isEmpty) {
      return OfflineWidget(
        title: 'No Characters',
        message: 'We couldn\'t find any characters matching your filters.',
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
