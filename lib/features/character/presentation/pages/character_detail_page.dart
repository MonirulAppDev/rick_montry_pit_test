import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/character.dart';
import '../providers/character_provider.dart';
import '../providers/favorite_provider.dart';
import '../../domain/usecases/delete_character_override.dart';
import '../../data/datasources/character_override_local_data_source.dart';
import '../../../../injection_container.dart';
import '../widgets/character_detail_widgets.dart';
import 'edit_character_page.dart';

class CharacterDetailPage extends ConsumerStatefulWidget {
  final Character character;
  final String heroPrefix;

  const CharacterDetailPage({
    super.key,
    required this.character,
    this.heroPrefix = 'character',
  });

  @override
  ConsumerState<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends ConsumerState<CharacterDetailPage> {
  late Character _character;

  @override
  void initState() {
    super.initState();
    _character = widget.character;
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteProvider.notifier).isFavorite(_character.id);
    final hasOverride = sl<CharacterOverrideLocalDataSource>().hasOverride(_character.id);
    ref.watch(favoriteProvider); // Rebuild when favorites change

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            actions: [
              if (hasOverride)
                IconButton(
                  onPressed: () async {
                    final result = await sl<DeleteCharacterOverride>().call(_character.id);
                    result.fold(
                      (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message))),
                      (_) {
                        ref.read(charactersProvider.notifier).fetchCharacters(isInitial: false);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reset to original data')));
                      },
                    );
                  },
                  icon: const Icon(Icons.restore_rounded, color: Colors.white),
                  tooltip: 'Reset to original',
                ),
              IconButton(
                onPressed: () async {
                  final updated = await Navigator.push<Character>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditCharacterPage(character: _character),
                    ),
                  );
                  if (updated != null) {
                    setState(() => _character = updated);
                  }
                },
                icon: const Icon(Icons.edit_rounded, color: Colors.white),
              ),
              IconButton(
                onPressed: () => ref.read(favoriteProvider.notifier).toggle(_character),
                icon: Icon(
                  isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 2))],
                ),
              ),
              background: Hero(
                tag: '${widget.heroPrefix}-${_character.id}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _character.image.isEmpty
                        ? Image.asset(
                            'assets/images/No_Image_Available.jpg',
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: _character.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(color: Colors.white10),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/No_Image_Available.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterStatusCard(character: _character),
                  const SizedBox(height: 24),
                  CharacterAboutSection(character: _character),
                  const SizedBox(height: 24),
                  CharacterOriginLocationSection(character: _character),
                  const SizedBox(height: 32),
                  CharacterEpisodesSection(character: _character),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
