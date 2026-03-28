import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_montry_pit_test/features/character/domain/entities/character.dart';
import 'package:rick_montry_pit_test/features/character/presentation/providers/character_provider.dart';
import 'package:rick_montry_pit_test/features/character/presentation/providers/favorite_provider.dart';
import 'package:rick_montry_pit_test/features/character/domain/usecases/delete_character_override.dart';
import 'package:rick_montry_pit_test/features/character/data/datasources/character_override_local_data_source.dart';
import 'package:rick_montry_pit_test/injection_container.dart';

import 'package:rick_montry_pit_test/features/character/presentation/pages/edit_character_page.dart';

class CharacterDetailPage extends ConsumerStatefulWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

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
                tag: 'character-${_character.id}',
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
                  _buildStatusCard(context),
                  const SizedBox(height: 24),
                  _buildAboutSection(context),
                  const SizedBox(height: 24),
                  _buildOriginLocationSection(context),
                  const SizedBox(height: 32),
                  _buildEpisodesSection(context),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    final statusColor = _character.status.toLowerCase() == 'alive'
        ? Colors.green
        : _character.status.toLowerCase() == 'dead'
            ? Colors.red
            : Colors.grey;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E26),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Text(
                  _character.status.toUpperCase(),
                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            '#${_character.id.toString().padLeft(3, '0')}',
            style: const TextStyle(color: Colors.white30, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specifications',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _specItem('Gender', _character.gender, Icons.person_outline_rounded)),
            const SizedBox(width: 12),
            Expanded(child: _specItem('Species', _character.species, Icons.fingerprint_rounded)),
          ],
        ),
        const SizedBox(height: 12),
        _specItem('Type', _character.type.isEmpty ? 'Unknown' : _character.type, Icons.bubble_chart_outlined, isFullWidth: true),
      ],
    );
  }

  Widget _specItem(String label, String value, IconData icon, {bool isFullWidth = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF252530),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF6B38FB), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOriginLocationSection(BuildContext context) {
    return Column(
      children: [
        _locationCard('Origin', _character.origin.name, Icons.public_rounded),
        const SizedBox(height: 16),
        _locationCard('Location', _character.location.name, Icons.location_on_rounded),
      ],
    );
  }

  Widget _locationCard(String label, String value, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E26),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: const Color(0xFF9D50BB), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Appears in',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              '${_character.episode.length} episodes',
              style: const TextStyle(color: Color(0xFF6B38FB), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _character.episode.map((url) {
            final id = url.split('/').last;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white10),
              ),
              child: Text(
                'EP $id',
                style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
