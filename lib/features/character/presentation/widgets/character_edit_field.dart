import 'package:flutter/material.dart';

class CharacterEditField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;

  const CharacterEditField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
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
        validator: (value) =>
            value == null || value.isEmpty ? 'Cannot be empty' : null,
      ),
    );
  }
}
