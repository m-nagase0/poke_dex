import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_picture_book/model/poke_model.dart';
import 'package:poke_picture_book/view/components/types_chips.dart';

class PokeIndividualPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokeIndividualPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? ""),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: pokemon.imageUrl?.front_default ?? "",
              ),
            ),
            Text("No.${pokemon.id}"),
            Text("Name:${pokemon.name}"),
            TypeChips(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
