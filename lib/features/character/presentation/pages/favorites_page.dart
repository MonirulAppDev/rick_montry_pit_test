import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorite_provider.dart';
import '../widgets/character_card.dart';
import '../widgets/favorite_empty_state.dart';
import 'character_detail_page.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteProvider);
    final filteredFavorites = favorites.where((character) {
      return character.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search favorites...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white38),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              )
            : const Text('My Favorites'),
        centerTitle: !_isSearching,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _isSearching = false;
                  _searchController.clear();
                  _searchQuery = '';
                } else {
                  _isSearching = true;
                }
              });
            },
          ),
        ],
      ),
      body: favorites.isEmpty
          ? const FavoriteEmptyState()
          : filteredFavorites.isEmpty
              ? const FavoriteNoResultsState()
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: filteredFavorites.length,
                  itemBuilder: (context, index) {
                    final character = filteredFavorites[index];
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
                  },
                ),
    );
  }
}
