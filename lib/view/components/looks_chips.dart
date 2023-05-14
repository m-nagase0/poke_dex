import 'package:flutter/material.dart';

import '../../model/poke_model.dart';

class LooksChips extends StatefulWidget {
  final Pokemon pokemon;

  final ValueChanged onLooksChipSelected;

  const LooksChips(
      {Key? key, required this.pokemon, required this.onLooksChipSelected})
      : super(key: key);

  @override
  State<LooksChips> createState() => _LooksChipsState();
}

class _LooksChipsState extends State<LooksChips> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    List<String> pokeImages = [
      "front",
      "back",
      "front_a",
      "back_a",
    ];

    return Wrap(
        spacing: 4.0,
        children: List.generate(pokeImages.length, (int index) {
          return ChoiceChip(
              label: Text(pokeImages[index], style: const TextStyle(color: Colors.white),),
              selected: value == index,
              selectedColor: Colors.red,
              backgroundColor: Colors.grey,
              onSelected: (bool isSelected) {
                setState(() {
                  value = isSelected ? index : 0;
                  widget.onLooksChipSelected(index);
                });
              }
          );
        }).toList()
    );
  }
}
