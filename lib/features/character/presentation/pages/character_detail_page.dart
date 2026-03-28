import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 2))],
                ),
              ),
              background: Hero(
                tag: 'character-${character.id}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    character.image.isEmpty
                        ? Image.asset(
                            'assets/images/No_Image_Available.jpg',
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: character.image,
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
    final statusColor = character.status.toLowerCase() == 'alive'
        ? Colors.green
        : character.status.toLowerCase() == 'dead'
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
                  character.status.toUpperCase(),
                  style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'ID: #${character.id}',
                style: const TextStyle(color: Colors.white30, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                character.species,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
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
          'About',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 12),
        _infoItem('Gender', character.gender, Icons.person_outline),
        _infoItem('Species', character.species, Icons.category_outlined),
        _infoItem('Type', character.type.isEmpty ? 'Unknown' : character.type, Icons.info_outline),
      ],
    );
  }

  Widget _infoItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6B38FB), size: 20),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(color: Colors.white54, fontSize: 16)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildOriginLocationSection(BuildContext context) {
    return Column(
      children: [
        _locationCard('Origin', character.origin.name, Icons.public_rounded),
        const SizedBox(height: 16),
        _locationCard('Location', character.location.name, Icons.location_on_rounded),
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
              '${character.episode.length} episodes',
              style: const TextStyle(color: Color(0xFF6B38FB), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Since we don't have episode titles here, we just show a grid of episode numbers or similar
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: character.episode.map((url) {
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
