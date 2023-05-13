import 'package:flutter/material.dart';
import 'package:poke_picture_book/model/poke_model.dart';
import 'package:poke_picture_book/view/components/image_from_url.dart';

class PokeTile extends StatelessWidget {
  final Pokemon pokemon;
  final ValueChanged onPokeTileClicked;

  PokeTile({super.key, required this.pokemon, required this.onPokeTileClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () => onPokeTileClicked(pokemon),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ImageFromUrl(imageUrl: pokemon.imageUrl?.front_default),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "No：",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(pokemon.id.toString()),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Name：",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(pokemon.name ?? ""),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
