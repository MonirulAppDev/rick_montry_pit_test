import 'package:equatable/equatable.dart';

class CharacterLocation extends Equatable {
  final String name;
  final String url;

  const CharacterLocation({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}
