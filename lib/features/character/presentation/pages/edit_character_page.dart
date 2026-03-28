import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/character_location.dart';
import '../../domain/usecases/update_character_override.dart';
import '../providers/character_provider.dart';
import '../providers/favorite_provider.dart';
import '../../../../injection_container.dart';

class EditCharacterPage extends ConsumerStatefulWidget {
  final Character character;

  const EditCharacterPage({super.key, required this.character});

  @override
  ConsumerState<EditCharacterPage> createState() => _EditCharacterPageState();
}

class _EditCharacterPageState extends ConsumerState<EditCharacterPage> {
  late TextEditingController _nameController;
  late TextEditingController _statusController;
  late TextEditingController _speciesController;
  late TextEditingController _typeController;
  late TextEditingController _genderController;
  late TextEditingController _originController;
  late TextEditingController _locationController;

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.character.name);
    _statusController = TextEditingController(text: widget.character.status);
    _speciesController = TextEditingController(text: widget.character.species);
    _typeController = TextEditingController(text: widget.character.type);
    _genderController = TextEditingController(text: widget.character.gender);
    _originController = TextEditingController(text: widget.character.origin.name);
    _locationController = TextEditingController(text: widget.character.location.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _statusController.dispose();
    _speciesController.dispose();
    _typeController.dispose();
    _genderController.dispose();
    _originController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final updatedCharacter = Character(
      id: widget.character.id,
      name: _nameController.text,
      status: _statusController.text,
      species: _speciesController.text,
      type: _typeController.text,
      gender: _genderController.text,
      image: widget.character.image,
      url: widget.character.url,
      created: widget.character.created,
      origin: CharacterLocation(name: _originController.text, url: widget.character.origin.url),
      location: CharacterLocation(name: _locationController.text, url: widget.character.location.url),
      episode: widget.character.episode,
    );

    final result = await sl<UpdateCharacterOverride>().call(updatedCharacter);

    if (mounted) {
      result.fold(
        (failure) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
        },
        (_) {
          // Update local state in providers
          ref.read(charactersProvider.notifier).updateLocalCharacter(updatedCharacter);
          ref.read(favoriteProvider.notifier).updateLocalCharacter(updatedCharacter);
          
          Navigator.pop(context, updatedCharacter);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Character'),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            IconButton(onPressed: _save, icon: const Icon(Icons.check_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField('Name', _nameController, Icons.person_rounded),
              _buildField('Status', _statusController, Icons.info_outline_rounded),
              _buildField('Species', _speciesController, Icons.fingerprint_rounded),
              _buildField('Type', _typeController, Icons.bubble_chart_outlined),
              _buildField('Gender', _genderController, Icons.wc_rounded),
              _buildField('Origin Name', _originController, Icons.public_rounded),
              _buildField('Location Name', _locationController, Icons.location_on_rounded),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B38FB),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save Changes', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF6B38FB)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: const Color(0xFF1E1E26),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Cannot be empty' : null,
      ),
    );
  }
}
