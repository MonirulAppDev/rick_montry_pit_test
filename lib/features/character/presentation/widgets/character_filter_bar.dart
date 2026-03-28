import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/character_provider.dart';
import '../providers/character_state.dart';

class CharacterFilterBar extends ConsumerWidget {
  final CharacterState state;

  const CharacterFilterBar({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E26),
        border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _FilterGroup(
              title: 'Status',
              options: const ['Alive', 'Dead', 'Unknown'],
              currentValue: state.statusFilter,
              onSelected: (val) => ref
                  .read(charactersProvider.notifier)
                  .updateFilters(status: val),
            ),
            const SizedBox(width: 16),
            Container(width: 1, height: 24, color: Colors.white10),
            const SizedBox(width: 16),
            _FilterGroup(
              title: 'Species',
              options: const ['Human', 'Alien'],
              currentValue: state.speciesFilter,
              onSelected: (val) => ref
                  .read(charactersProvider.notifier)
                  .updateFilters(species: val),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterGroup extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? currentValue;
  final Function(String) onSelected;

  const _FilterGroup({
    required this.title,
    required this.options,
    this.currentValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
              color: Colors.white38, fontSize: 13, fontWeight: FontWeight.bold),
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
}
