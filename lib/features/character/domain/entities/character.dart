import 'package:equatable/equatable.dart';
import 'character_location.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String type;
  final String gender;
  final String url;
  final String created;
  final CharacterLocation origin;
  final CharacterLocation location;
  final List<String> episode;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.type,
    required this.gender,
    required this.url,
    required this.created,
    required this.origin,
    required this.location,
    required this.episode,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    image,
    type,
    gender,
    url,
    created,
    origin,
    location,
    episode,
  ];
}
