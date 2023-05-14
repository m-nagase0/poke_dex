import 'package:flutter/material.dart';
import 'package:poke_picture_book/model/poke_model.dart';

class AbilityChips extends StatelessWidget {
  final Pokemon pokemon;

  const AbilityChips({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(
        pokemon.abilities!.length,
        (index) {
          final abilityName =
              pokemon.abilities?[index]['ability']['name'] as String;
          return Chip(
            label: Text(abilityName),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          );
        },
      ),
    );
  }
}
