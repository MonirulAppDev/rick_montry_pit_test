import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../widgets/character_filter_bar.dart';
import '../widgets/character_grid.dart';

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

    ref.listen(charactersProvider, (previous, next) {
      if (previous?.isLoadingMore == true && next.isLoadingMore == false) {
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
          CharacterFilterBar(state: characterState),
          Expanded(
            child: CharacterGrid(
              state: characterState,
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
