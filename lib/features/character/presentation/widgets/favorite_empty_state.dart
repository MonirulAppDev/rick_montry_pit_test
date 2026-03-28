import 'package:flutter/material.dart';

class FavoriteEmptyState extends StatelessWidget {
  const FavoriteEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border_rounded, size: 80, color: Colors.white10),
          const SizedBox(height: 16),
          const Text(
            'No favorites yet',
            style: TextStyle(color: Colors.white38, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class FavoriteNoResultsState extends StatelessWidget {
  const FavoriteNoResultsState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No characters found',
        style: TextStyle(color: Colors.white38, fontSize: 18),
      ),
    );
  }
}
