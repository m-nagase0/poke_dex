import 'package:flutter/material.dart';
import 'package:poke_picture_book/model/poke_model.dart';

class TypeChips extends StatelessWidget {
  final Pokemon pokemon;

  const TypeChips({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 4,
        children: List.generate(
          pokemon.types!.length,
              (index) =>
              Chip(
                label: Text(pokemon.types![index].name!, style: const TextStyle(color: Colors.white),),
                backgroundColor: getTypeColor(pokemon.types![index].name),
              ),
        )
    );
  }

  Color getTypeColor(type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return Colors.brown[400]!;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.amber;
      case 'grass':
        return Colors.green;
      case 'ice':
        return Colors.cyanAccent[400]!;
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange[300]!;
      case 'flying':
        return Colors.indigo;
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen[500]!;
      case 'rock':
        return Colors.grey;
      case 'ghost':
        return Colors.indigo[400]!;
      case 'dragon':
        return Colors.indigo[900]!;
      case 'dark':
        return Colors.brown[900]!;
      case 'steel':
        return Colors.blueGrey[300]!;
      case 'fairy':
        return Colors.pinkAccent[100]!;
      default:
        return Colors.grey;
    }
  }
}
