import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterStatusCard extends StatelessWidget {
  final Character character;

  const CharacterStatusCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(
                      color: statusColor, shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Text(
                  character.status.toUpperCase(),
                  style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            '#${character.id.toString().padLeft(3, '0')}',
            style: const TextStyle(
                color: Colors.white30,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}

class CharacterAboutSection extends StatelessWidget {
  final Character character;

  const CharacterAboutSection({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specifications',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: CharacterSpecItem(
                    label: 'Gender',
                    value: character.gender,
                    icon: Icons.person_outline_rounded)),
            const SizedBox(width: 12),
            Expanded(
                child: CharacterSpecItem(
                    label: 'Species',
                    value: character.species,
                    icon: Icons.fingerprint_rounded)),
          ],
        ),
        const SizedBox(height: 12),
        CharacterSpecItem(
            label: 'Type',
            value: character.type.isEmpty ? 'Unknown' : character.type,
            icon: Icons.bubble_chart_outlined,
            isFullWidth: true),
      ],
    );
  }
}

class CharacterSpecItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isFullWidth;

  const CharacterSpecItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(label,
                    style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
                Text(value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterOriginLocationSection extends StatelessWidget {
  final Character character;

  const CharacterOriginLocationSection({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CharacterLocationCard(
            label: 'Origin',
            value: character.origin.name,
            icon: Icons.public_rounded),
        const SizedBox(height: 16),
        CharacterLocationCard(
            label: 'Location',
            value: character.location.name,
            icon: Icons.location_on_rounded),
      ],
    );
  }
}

class CharacterLocationCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const CharacterLocationCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: const Color(0xFF9D50BB), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(color: Colors.white54, fontSize: 12)),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterEpisodesSection extends StatelessWidget {
  final Character character;

  const CharacterEpisodesSection({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Appears in',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              '${character.episode.length} episodes',
              style: const TextStyle(
                  color: Color(0xFF6B38FB), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
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
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
